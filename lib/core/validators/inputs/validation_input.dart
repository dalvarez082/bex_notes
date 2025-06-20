import 'package:bex_notes/app/global_bloc/text_input/text_input_config.dart';

class Validation {
  static const email = TextInputConfig(validator: _validateEmail);

  static const password = TextInputConfig(validator: _validatePassword);

  static const username = TextInputConfig(validator: _validateUsername);

  static String? _validateEmail(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return 'Este campo es obligatorio';
    final regex = RegExp(r"^[\w\.-]+@[\w\.-]+\.\w{2,4}$");
    if (!regex.hasMatch(trimmed)) return 'Formato inválido';
    return null;
  }

  static String? _validatePassword(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return 'Este campo es obligatorio';
    if (trimmed.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }

  static String? _validateUsername(String value) {
    final trimmed = value.trim();
    if (trimmed.isEmpty) return 'Este campo es obligatorio';
    if (trimmed.length < 3) return 'Mínimo 3 caracteres';
    return null;
  }
}
