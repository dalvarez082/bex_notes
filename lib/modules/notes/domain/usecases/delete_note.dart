import '../repositories/note_repository.dart';

class DeleteNote {
  final NoteRepository repository;

  DeleteNote(this.repository);

  Future<void> call(int noteId) async {
    await repository.deleteNote(noteId);
  }
}