import '../entities/user.dart';
import '../repositories/user_repository.dart';

class RegisterUser {
  final UserRepository repository;

  RegisterUser(this.repository);

  Future<void> call(User user) async {
    final exists = await repository.checkIfEmailExists(user.email);
    if (exists) throw Exception('El email ya está registrado.');
    await repository.registerUser(user);
  }
}
