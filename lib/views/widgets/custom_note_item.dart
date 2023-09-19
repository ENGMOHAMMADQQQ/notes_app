import 'package:flutter/material.dart';
import 'package:untitled3/views/edit_note_view.dart';

class NotesItems extends StatelessWidget {
  const NotesItems({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const EditNoteView();
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 16, top: 16, left: 16),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 235, 168, 117),
            borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 24,
                  )),
              title: const Padding(
                padding: EdgeInsets.only(bottom: 12),
                child: Text(
                  'Flutter Tips',
                  style: TextStyle(fontSize: 26, color: Colors.black),
                ),
              ),
              subtitle: Text(
                'Build your career with\nMohammed Ashraf ',
                style: TextStyle(
                    fontSize: 18, color: Colors.black.withOpacity(.4)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24, top: 12),
              child: Text("May21,2023",
                  style: TextStyle(
                      fontSize: 16, color: Colors.black.withOpacity(.4))),
            )
          ],
        ),
      ),
    );
  }
}
