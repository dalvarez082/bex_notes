
class DisplayNameValidators {
  /// Valida que el display name no esté vacío y tenga al menos 3 caracteres.
  static String? basic(String value) {
    final trimmed = value.trim();

    if (trimmed.isEmpty) {
      return 'Este campo es obligatorio';
    }

    if (trimmed.length < 3) {
      return 'Debe tener al menos 3 caracteres';
    }

    return null;
  }

  
}
