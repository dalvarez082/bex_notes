import 'package:bex_notes/modules/notes/domain/usecases/update_note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bex_notes/modules/notes/data/datasources/note_local_datasource.dart';
import 'package:bex_notes/modules/notes/data/repositories/note_repository_impl.dart';
import 'package:bex_notes/modules/notes/domain/usecases/add_note.dart';
import 'package:bex_notes/modules/notes/domain/usecases/get_notes.dart';
import 'package:bex_notes/modules/notes/domain/usecases/delete_note.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetNotes _getNotes;
  final AddNote _addNote;
  final DeleteNote _deleteNote;
  final UpdateNote _updateNote;

  NoteBloc()
      : _getNotes = GetNotes(NoteRepositoryImpl(NoteLocalDataSource())),
        _addNote = AddNote(NoteRepositoryImpl(NoteLocalDataSource())),
        _deleteNote = DeleteNote(NoteRepositoryImpl(NoteLocalDataSource())),
         _updateNote = UpdateNote(NoteRepositoryImpl(NoteLocalDataSource())),
        super(NoteInitial()) {
    on<LoadNotes>(_onLoadNotes);
    on<AddNoteEvent>(_onAddNote);
    on<DeleteNoteEvent>(_onDeleteNote);
    on<UpdateNoteEvent>(_onUpdateNote);
  }

  Future<void> _onLoadNotes(LoadNotes event, Emitter<NoteState> emit) async {
    emit(NoteLoading());
    try {
      final notes = await _getNotes(event.userId);
      emit(NoteLoaded(notes));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  Future<void> _onAddNote(AddNoteEvent event, Emitter<NoteState> emit) async {
    try {
      await _addNote(event.note);
      add(LoadNotes(event.note.userId));
    } catch (e) {
      emit(NoteError(e.toString()));
    }
  }

  Future<void> _onDeleteNote(DeleteNoteEvent event, Emitter<NoteState> emit) async {
    try {
      await _deleteNote(event.noteId);
      add(LoadNotes(event.userId));
    } catch (e) {
      emit(NoteError('Error eliminando la nota'));
    }
  }


  Future<void> _onUpdateNote(UpdateNoteEvent event, Emitter<NoteState> emit) async {
  try {
    await _updateNote(event.note);
    add(LoadNotes(event.note.userId));
  } catch (e) {
    emit(NoteError('Error actualizando la nota'));
  }
}
}
