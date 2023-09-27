part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class NotesLoading extends NotesState {}

final class Notessuccess extends NotesState {
  final List<NoteModel> note;

  Notessuccess(this.note);
}

final class Notesfailure extends NotesState {
  final String error;

  Notesfailure(this.error);
}
