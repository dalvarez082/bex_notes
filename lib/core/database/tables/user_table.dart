class UserTable {
  static const String tableName = 'users';

  static const String createTable = '''
    CREATE TABLE $tableName (
      user_id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      email TEXT UNIQUE NOT NULL,
      password TEXT NOT NULL,
      created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    );
  ''';

  static const String dropTable = 'DROP TABLE IF EXISTS $tableName;';
}
