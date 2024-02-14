// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cubittheme/core/consts.dart';
import 'package:cubittheme/notes/model/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'read_notes_state.dart';

class ReadNotesCubit extends Cubit<ReadNotesState> {
  ReadNotesCubit() : super(ReadNotesInitial()) {
    readNotes();
  }
  readNotes() {
    emit(ReadNotesLoading());
    try {
      var notesbox = Hive.box<NoteModel>(knotesBox);
      final List<NoteModel> notes = notesbox.values.toList();
      emit(ReadNotessuccess(notes));
      // print(notes);
    } catch (e) {
      emit(ReadNotesFailed(e.toString()));
      // print(e);
    }
  }
}
