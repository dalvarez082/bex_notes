import 'package:bex_notes/app/global_bloc/text_input/class_blocs.dart';
import 'package:flutter/material.dart';
import 'package:bex_notes/global_widgets/atoms/text_input_field.dart';


class SignupFormFields extends StatelessWidget {
  const SignupFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        TextInputField<UsernameBloc>(label: 'Nombre de usuario'),
        SizedBox(height: 16),
        TextInputField<EmailBloc>(label: 'Correo electrónico'),
        SizedBox(height: 16),
        TextInputField<PasswordBloc>(label: 'Contraseña', isPassword: true),
      ],
    );
  }
}
