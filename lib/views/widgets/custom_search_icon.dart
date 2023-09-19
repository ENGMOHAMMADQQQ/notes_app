import 'package:flutter/material.dart';
class CoustomSearchIcon extends StatelessWidget {
  const CoustomSearchIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: 46,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16)
        
      ),
      child:const Center(child: Icon(Icons.search,size: 28,),),
    );
  }
}