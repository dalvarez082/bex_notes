import 'package:bex_notes/app/global_bloc/text_input/class_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bex_notes/global_widgets/atoms/button_filled.dart';


class SignupContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SignupContinueButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final usernameValid = context.select<UsernameBloc, bool>((b) => b.state.isValid);
    final emailValid = context.select<EmailBloc, bool>((b) => b.state.isValid);
    final passwordValid = context.select<PasswordBloc, bool>((b) => b.state.isValid);

    final isEnabled = usernameValid && emailValid && passwordValid;

    return ButtonFilled(
      text: 'Registrarse',
      onPressed: onPressed,
      enabled: isEnabled,
    );
  }
}
