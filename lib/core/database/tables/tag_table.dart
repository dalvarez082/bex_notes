class TagTable {
  static const String tableName = 'tags';

  static const String createTable = '''
    CREATE TABLE $tableName (
      tag_id INTEGER PRIMARY KEY AUTOINCREMENT,
      user_id INTEGER NOT NULL,
      name TEXT NOT NULL,
      UNIQUE(user_id, name),
      FOREIGN KEY (user_id) REFERENCES users(user_id)
    );
  ''';

  static const String dropTable = 'DROP TABLE IF EXISTS $tableName;';
}
