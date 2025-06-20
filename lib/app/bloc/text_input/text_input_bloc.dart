import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'text_input_event.dart';
import 'text_input_state.dart';

class TextInputBloc extends Bloc<TextInputEvent, TextInputState> {
  final String? Function(String)? validator;
  final Future<String?> Function(String)? asyncValidator;
  Timer? _debounceTimer;

  TextInputBloc({
    this.validator,
    this.asyncValidator,
  }) : super(const TextInputState()) {
    on<TextChanged>(_onTextChanged);
  }

  Future<void> _onTextChanged(TextChanged event, Emitter<TextInputState> emit) async {
    _debounceTimer?.cancel();
    final value = event.value;
    final syncError = validator?.call(value);

    emit(state.copyWith(
      text: value,
      isDirty: true,
      error: syncError,
    ));

    _debounceTimer = Timer(const Duration(milliseconds: 600), () async {
      if (asyncValidator != null) {
        emit(state.copyWith(isChecking: true));
        final asyncError = await asyncValidator!(value);
        emit(state.copyWith(error: asyncError, isChecking: false));
      }
    });
  }

  @override
  Future<void> close() {
    _debounceTimer?.cancel();
    return super.close();
  }
}
