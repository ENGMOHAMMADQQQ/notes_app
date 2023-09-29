import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled3/models/note_model.dart';
// import 'package:untitled3/constants.dart';

import '../../cubit/add_note_cubit/add_note_cubit.dart';
import 'custom_botton.dart';
import 'custtom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child:
          BlocConsumer<AddNoteCubit, AddNoteState>(listener: (context, state) {
        if (state is AddNoteFailure) {
          print('fieded ${state.errorMasseg}');
        }
        if (state is AddNoteSuccess) {
          Navigator.pop(context);
        }
      }, builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is AddNoteLoding ? true : false,
          child: SingleChildScrollView(
              child: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const FormTextfield(),
          )),
        );
      }),
    );
  }
}

class FormTextfield extends StatefulWidget {
  const FormTextfield({
    super.key,
  });

  @override
  State<FormTextfield> createState() => _FormTextfieldState();
}

class _FormTextfieldState extends State<FormTextfield> {
  final GlobalKey<FormState> formkey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 32),
          CusttomTextField(
            onsave: (value) {
              title = value;
            },
            hint: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CusttomTextField(
            onsave: (value) {
              subtitle = value;
            },
            hint: 'Contant',
            maxline: 5,
          ),
          const SizedBox(
            height: 32,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomBotton(
                isLoding: state is AddNoteLoding ? true : false,
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    formkey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formatedcurrentDate =  DateFormat('dd-mm-yyyy').format(currentDate);
                    var notemodel = NoteModel(
                        title: title!,
                        subtitle: subtitle!,
                        date: formatedcurrentDate.toString(),
                        color: Colors.amber.value);
                    BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
