import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bex_notes/app/global_bloc/text_input/text_input_bloc.dart';
import 'package:bex_notes/app/global_bloc/text_input/text_input_event.dart';
import 'package:bex_notes/app/global_bloc/text_input/text_input_state.dart';

class TextInputField<B extends TextInputBloc> extends StatefulWidget {
  final String label;
  final bool isPassword;
  final TextInputType keyboardType;

  const TextInputField({
    super.key,
    required this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<TextInputField<B>> createState() => _TextInputFieldState<B>();
}

class _TextInputFieldState<B extends TextInputBloc> extends State<TextInputField<B>> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<B, TextInputState>(
      builder: (context, state) {
        return TextFormField(
          initialValue: state.text,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? _obscure : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
            labelText: widget.label,
            errorText: state.isDirty ? state.error : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscure = !_obscure),
                  )
                : null,
          ),
          onChanged: (value) => context.read<B>().add(TextChanged(value)),
        );
      },
    );
  }
}
