import 'package:flutter/material.dart';
import 'package:untitled3/constants.dart';

import 'custom_botton.dart';
import 'custtom_text_field.dart';
class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
          SizedBox(height: 32),
          CusttomTextField(hint: 'Title',),
          SizedBox(height: 16,),
          CusttomTextField(hint: 'Contant', maxline: 5,),
          SizedBox(height: 32,),
          CustomBotton(),
          SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
