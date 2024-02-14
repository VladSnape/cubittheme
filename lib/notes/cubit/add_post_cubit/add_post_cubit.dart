// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:cubittheme/core/consts.dart';
import 'package:cubittheme/notes/model/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'add_post_state.dart';

class AddPostCubit extends Cubit<AddPostState> {
  AddPostCubit() : super(AddPostInitial());
  addNote(NoteModel note) async {
    emit(AddPostLoading());
    var box = Hive.box<NoteModel>(knotesBox);

    try {
      await box.add(note);
      emit(AddPostSuccess());
      // print(" add post succes $AddPostSuccess()");
    } catch (e) {
      emit(AddPostFailed(e.toString()));
      // print(" add post failed  $AddPostFailed() ===== this is why ${e}");
    }
  }

  updateNote(NoteModel note, dynamic key) async {
    emit(AddPostLoading());
    var box = Hive.box<NoteModel>(knotesBox);

    try {
      await box.put(key, note);
      emit(AddPostSuccess());
      // print(" add post succes $AddPostSuccess()");
    } catch (e) {
      emit(AddPostFailed(e.toString()));
      // print(" add post failed  $AddPostFailed() ===== this is why ${e}");
    }
  }

  deleteNote(dynamic key) async {
    emit(AddPostLoading());
    var box = Hive.box<NoteModel>(knotesBox);

    try {
      await box.delete(key);
      emit(AddPostSuccess());
      // print(" add post succes $AddPostSuccess()");
    } catch (e) {
      emit(AddPostFailed(e.toString()));
      // print(" add post failed  $AddPostFailed() ===== this is why ${e}");
    }
  }
}
