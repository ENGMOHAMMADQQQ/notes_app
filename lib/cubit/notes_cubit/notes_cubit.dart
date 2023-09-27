import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';
import '../../models/note_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllnotes() {
    emit(NotesLoading());
    try {
      var noteBox = Hive.box<NoteModel>(kNotesBox);
      final List<NoteModel> note = noteBox.values.toList();
      emit(Notessuccess(note));
    } catch (errorMasseg) {
      emit(Notesfailure(errorMasseg.toString()));
    }
  }
}
