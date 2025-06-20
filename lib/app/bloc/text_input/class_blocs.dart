import 'package:bex_notes/app/bloc/text_input/text_input_bloc.dart';
import 'package:bex_notes/core/validators/inputs/validation_input.dart';

class EmailBloc extends TextInputBloc {
  EmailBloc() : super(validator: Validation.email.validator);
}

class PasswordBloc extends TextInputBloc {
  PasswordBloc() : super(validator: Validation.password.validator);
}

class UsernameBloc extends TextInputBloc {
  UsernameBloc() : super(validator: Validation.username.validator);
}
