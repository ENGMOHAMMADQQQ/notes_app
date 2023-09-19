import 'package:flutter/material.dart';

import '../../constants.dart';

class CusttomTextField extends StatelessWidget {
  const CusttomTextField({super.key, required this.hint, this.maxline = 1});
  final String hint;
  final int maxline;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      maxLines: maxline,
      decoration: InputDecoration(
        border: buildborder(),
        hintText: hint,
        focusedBorder: buildborder(kPrimaryColor),
        enabledBorder: buildborder(),
      ),
    );
  }

  OutlineInputBorder buildborder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: color ?? Colors.white));
  }
}
