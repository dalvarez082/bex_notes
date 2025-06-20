class NoteTagTable {
  static const String tableName = 'note_tags';

  static const String createTable = '''
    CREATE TABLE $tableName (
      note_id INTEGER NOT NULL,
      tag_id INTEGER NOT NULL,
      PRIMARY KEY (note_id, tag_id),
      FOREIGN KEY (note_id) REFERENCES notes(note_id),
      FOREIGN KEY (tag_id) REFERENCES tags(tag_id)
    );
  ''';

  static const String dropTable = 'DROP TABLE IF EXISTS $tableName;';
}
