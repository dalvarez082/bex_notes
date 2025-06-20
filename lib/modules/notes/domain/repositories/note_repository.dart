import '../entities/note.dart';

abstract class NoteRepository {
  Future<void> addNote(Note note);
  Future<List<Note>> getAllNotes(int userId);
  Future<void> deleteNote(int noteId);
  Future<void> updateNote(Note note);
}
