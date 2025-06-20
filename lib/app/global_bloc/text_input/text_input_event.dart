import 'package:equatable/equatable.dart';

abstract class TextInputEvent extends Equatable {
  const TextInputEvent();

  @override
  List<Object?> get props => [];
}

class TextChanged extends TextInputEvent {
  final String value;

  const TextChanged(this.value);

  @override
  List<Object?> get props => [value];
}
