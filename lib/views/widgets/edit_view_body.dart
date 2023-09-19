import 'package:flutter/material.dart';
import 'package:untitled3/views/widgets/custom_app_bar.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(icon: Icons.check, title: 'Edit Note',)
        ],
      ),
    );
  }
}
