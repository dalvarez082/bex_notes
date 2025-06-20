import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bex_notes/global_widgets/atoms/button_filled.dart';
import 'package:bex_notes/app/global_bloc/text_input/class_blocs.dart';

class LoginContinueButton extends StatelessWidget {
  final VoidCallback onPressed;

  const LoginContinueButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final emailValid = context.select<EmailBloc, bool>((bloc) => bloc.state.isValid);
    final passwordValid = context.select<PasswordBloc, bool>((bloc) => bloc.state.isValid);
    final isEnabled = emailValid && passwordValid;

    return ButtonFilled(
      text: 'Continuar',
      onPressed: onPressed,
      enabled: isEnabled,
    );
  }
}
