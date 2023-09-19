import 'package:flutter/material.dart';
import 'package:untitled3/views/widgets/custom_app_bar.dart';
import 'package:untitled3/views/widgets/custtom_text_field.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(icon: Icons.check, title: 'Edit Note',),
          SizedBox(height: 50,),
          CusttomTextField(hint: 'Title'),
          SizedBox(height: 16,),
          CusttomTextField(hint: 'content',maxline: 5,),


        ],
      ),
    );
  }
}
