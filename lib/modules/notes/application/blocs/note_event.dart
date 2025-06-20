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


class DeleteNoteEvent extends NoteEvent {
  final int noteId;
  final int userId;

  DeleteNoteEvent(this.noteId, this.userId);
}


class UpdateNoteEvent extends NoteEvent {
  final Note note;
  UpdateNoteEvent(this.note);
}