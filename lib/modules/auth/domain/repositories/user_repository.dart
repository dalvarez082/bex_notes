import '../entities/user.dart';

abstract class UserRepository {
  Future<void> registerUser(User user);
  Future<bool> checkIfEmailExists(String email);
  Future<User?> getUserByEmail(String email);
}
