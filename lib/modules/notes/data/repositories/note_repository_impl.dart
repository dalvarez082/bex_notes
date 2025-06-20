import '../../domain/entities/note.dart';
import '../../domain/repositories/note_repository.dart';
import '../datasources/note_local_datasource.dart';
import '../models/note_model.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteLocalDataSource localDataSource;

  NoteRepositoryImpl(this.localDataSource);

  @override
  Future<void> addNote(Note note) async {
    final model = NoteModel(
      userId: note.userId,
      title: note.title,
      content: note.content,
      createdAt: note.createdAt,
    );
    await localDataSource.insertNote(model);
  }

  @override
  Future<List<Note>> getAllNotes(int userId) {
    return localDataSource.getAllNotesByUser(userId);
  }

  @override
  Future<void> deleteNote(int noteId) { // 
    return localDataSource.deleteNote(noteId);
  }


  @override
Future<void> updateNote(Note note) async {
  final model = NoteModel(
    id: note.id,
    userId: note.userId,
    title: note.title,
    content: note.content,
    createdAt: note.createdAt,
  );
  await localDataSource.updateNote(model);
}



}
