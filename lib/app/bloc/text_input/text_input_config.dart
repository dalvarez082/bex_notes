class TextInputConfig {
  final String? Function(String)? validator;
  final Future<String?> Function(String)? asyncValidator;
  final bool keepAlive;

  const TextInputConfig({
    this.validator,
    this.asyncValidator,
    this.keepAlive = false,
  });

  TextInputConfig copyWith({
    String? Function(String)? validator,
    Future<String?> Function(String)? asyncValidator,
    bool? keepAlive,
  }) {
    return TextInputConfig(
      validator: validator ?? this.validator,
      asyncValidator: asyncValidator ?? this.asyncValidator,
      keepAlive: keepAlive ?? this.keepAlive,
    );
  }
}
