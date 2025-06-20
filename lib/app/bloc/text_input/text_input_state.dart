import 'package:equatable/equatable.dart';

class TextInputState extends Equatable {
  final String text;
  final String? error;
  final bool isDirty;
  final bool isChecking;

  const TextInputState({
    this.text = '',
    this.error,
    this.isDirty = false,
    this.isChecking = false,
  });

  bool get isValid => error == null && isDirty;

  TextInputState copyWith({
    String? text,
    String? error,
    bool? isDirty,
    bool? isChecking,
  }) {
    return TextInputState(
      text: text ?? this.text,
      error: error,
      isDirty: isDirty ?? this.isDirty,
      isChecking: isChecking ?? this.isChecking,
    );
  }

  @override
  List<Object?> get props => [text, error, isDirty, isChecking];
}
