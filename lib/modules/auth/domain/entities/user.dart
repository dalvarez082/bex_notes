class User {
  final int? id;
  final String name;
  final String email; 
  final String password;
  final DateTime createdAt;

  const User({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.createdAt,
  });
}
