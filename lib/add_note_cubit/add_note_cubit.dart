import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled3/constants.dart';
import 'package:untitled3/models/note_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());
  addNote(NoteModel note) async {
    emit(AddNoteLoding());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      await noteBox.add(note);
      emit(AddNoteSuccess());
    } on Exception catch (errorMasseg) {
      emit(AddNoteFailure(errorMasseg.toString()));
    }
  }
}
