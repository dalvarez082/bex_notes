import 'package:bex_notes/modules/notes/data/datasources/note_local_datasource.dart';
import 'package:bex_notes/modules/notes/data/repositories/note_repository_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/add_note.dart';
import '../../domain/usecases/get_notes.dart';
import 'note_event.dart';
import 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  final GetNotes getNotes;
  final AddNote addNote;

  NoteBloc()
      : getNotes = GetNotes(NoteRepositoryImpl(NoteLocalDataSource())),
        addNote = AddNote(NoteRepositoryImpl(NoteLocalDataSource())),
        super(NoteInitial()) {
    on<LoadNotes>((event, emit) async {
      emit(NoteLoading());
      try {
        final notes = await getNotes(event.userId);
        emit(NoteLoaded(notes));
      } catch (e) {
        emit(NoteError(e.toString()));
      }
    });

    on<AddNoteEvent>((event, emit) async {
      try {
        await addNote(event.note);
        add(LoadNotes(event.note.userId));
      } catch (e) {
        emit(NoteError(e.toString()));
      }
    });
  }


  
}
