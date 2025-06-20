import '../../domain/entities/note.dart';

abstract class NoteEvent {}

class LoadNotes extends NoteEvent {
  final int userId;
  LoadNotes(this.userId);
}

class AddNoteEvent extends NoteEvent {
  final Note note;
  AddNoteEvent(this.note);
}
