import '../entities/user.dart';
import '../repositories/user_repository.dart';
import 'package:bex_notes/core/utils/hash_utils.dart';

class LoginUser {
  final UserRepository repository;

  LoginUser(this.repository);

  Future<User> call(String email, String rawPassword) async {
    final user = await repository.getUserByEmail(email);
    final hashed = hashPassword(rawPassword);

    if (user == null || user.password != hashed) {
      throw Exception('Correo o contraseña incorrectos');
    }

    return user;
  }
}
