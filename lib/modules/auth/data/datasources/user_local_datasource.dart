import 'package:bex_notes/core/database/database_helper.dart';
import '../models/user_model.dart';

class UserLocalDataSource {
  Future<int> insertUser(UserModel user) async {
    final db = await DatabaseHelper.instance.database;
    return await db.insert('users', user.toMap());
  }

  Future<bool> emailExists(String email) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    return result.isNotEmpty;
  }

  Future<UserModel?> getUserByEmail(String email) async {
  final db = await DatabaseHelper.instance.database;
  final result = await db.query(
    'users',
    where: 'email = ?',
    whereArgs: [email],
  );

  if (result.isEmpty) return null;
  return UserModel.fromMap(result.first);
}
}
