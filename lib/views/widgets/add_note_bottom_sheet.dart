import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:untitled3/add_note_cubit/add_note_cubit.dart';
import 'package:untitled3/models/note_model.dart';
// import 'package:untitled3/constants.dart';

import 'custom_botton.dart';
import 'custtom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: Padding(
          padding:const EdgeInsets.symmetric(horizontal: 24),
          child: BlocConsumer<AddNoteCubit, AddNoteState>(
              listener: (context, state) {
            if (state is AddNoteFailure) {
              print('fieded ${state.errorMasseg}');
            }
            if (state is AddNoteSuccess) {
              Navigator.pop(context);
            }
          }, builder: (context, state) {
            return ModalProgressHUD(
                inAsyncCall: state is AddNoteLoding ? true : false,
                child: const SingleChildScrollView(child: FormTextfield()));
          })),
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
          CustomBotton(
            onTap: () {
              if (formkey.currentState!.validate()) {
                formkey.currentState!.save();
                var notemodel = NoteModel(
                    title: title!,
                    subtitle: subtitle!,
                    date: DateTime.now().toString(),
                    color: Colors.amber.value);
                BlocProvider.of<AddNoteCubit>(context).addNote(notemodel);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
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
