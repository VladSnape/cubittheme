part of 'read_notes_cubit.dart';

@immutable
sealed class ReadNotesState {}

final class ReadNotesInitial extends ReadNotesState {}

final class ReadNotessuccess extends ReadNotesState {
  final List<NoteModel> notes;

  ReadNotessuccess(this.notes);
}

final class ReadNotesFailed extends ReadNotesState {
  final String message;

  ReadNotesFailed(this.message);
}

final class ReadNotesLoading extends ReadNotesState {}
