import 'package:flutter/material.dart';

import '../constants.dart';

class CusttomTextField extends StatelessWidget {
  const CusttomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
        
        border: buildborder(),
        hintText: 'Title',
        focusedBorder: buildborder(kPrimaryColor),
        enabledBorder: buildborder(),
      ),
      
    );
    
  }

  OutlineInputBorder buildborder([color]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(
        color:color ?? Colors.white
      )
      );
  }
}
