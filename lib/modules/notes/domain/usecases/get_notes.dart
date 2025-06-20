import '../entities/note.dart';
import '../repositories/note_repository.dart';

class GetNotes {
  final NoteRepository repository;

  GetNotes(this.repository);

  Future<List<Note>> call(int userId) {
    return repository.getAllNotes(userId);
  }
}
