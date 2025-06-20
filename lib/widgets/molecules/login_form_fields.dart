import 'package:flutter/material.dart';

import 'package:bex_notes/widgets/atoms/text_input_field.dart';
import 'package:bex_notes/app/bloc/text_input/class_blocs.dart';

class LoginFormFields extends StatelessWidget {
  const LoginFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField<EmailBloc>(label: 'Correo electrónico'),
        SizedBox(height: 16),
        TextInputField<PasswordBloc>(label: 'Contraseña', isPassword: true),
      ],
    );
  }
}
