import 'package:bex_notes/modules/auth/domain/repositories/user_repository.dart';

import '../../domain/entities/user.dart';

import '../datasources/user_local_datasource.dart';
import '../models/user_model.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl(this.localDataSource);

  @override
  Future<void> registerUser(User user) async {
    final model = UserModel(
      name: user.name,
      email: user.email,
      password: user.password,
      createdAt: user.createdAt,
    );
    await localDataSource.insertUser(model);
  }

  @override
  Future<bool> checkIfEmailExists(String email) {
    return localDataSource.emailExists(email);
  }

  @override
Future<User?> getUserByEmail(String email) async {
  final model = await localDataSource.getUserByEmail(email);
  return model;
}
}
