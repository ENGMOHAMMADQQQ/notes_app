import 'package:flutter/material.dart';

import 'custtom_text_field.dart';
class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
        SizedBox(height: 32),
        CusttomTextField()
        ],
      ),
    );
  }
}
