import 'package:flutter/material.dart';
// import 'package:untitled3/constants.dart';

import 'custom_botton.dart';
import 'custtom_text_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: FormTextfield(),
      ),
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
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {
                  
                });
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
