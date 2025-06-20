import 'package:bex_notes/core/database/database_helper.dart';

import '../models/note_model.dart';

class NoteLocalDataSource {
  Future<void> insertNote(NoteModel note) async {
    final db = await DatabaseHelper.instance.database;
    await db.insert('notes', note.toMap());
  }

  Future<List<NoteModel>> getAllNotesByUser(int userId) async {
    final db = await DatabaseHelper.instance.database;
    final result = await db.query(
      'notes',
      where: 'user_id = ?',
      whereArgs: [userId],
      orderBy: 'created_at DESC',
    );
    return result.map((e) => NoteModel.fromMap(e)).toList();
  }

  Future<void> deleteNote(int noteId) async {
    final db = await DatabaseHelper.instance.database;
    await db.delete('notes', where: 'note_id = ?', whereArgs: [noteId]);
  }


  Future<void> updateNote(NoteModel note) async {
  final db = await DatabaseHelper.instance.database;
  await db.update(
    'notes',
    note.toMap(),
    where: 'note_id = ?',
    whereArgs: [note.id],
  );
}
}
