  class NoteTable {
    static const String tableName = 'notes';

    static const String createTable = '''
      CREATE TABLE $tableName (
        note_id INTEGER PRIMARY KEY AUTOINCREMENT,
        user_id INTEGER NOT NULL,
        title TEXT NOT NULL,
        content TEXT,
        image_path TEXT,
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        updated_at TIMESTAMP,
        FOREIGN KEY (user_id) REFERENCES users(user_id)
      );
    ''';

    static const String dropTable = 'DROP TABLE IF EXISTS $tableName;';
  }
