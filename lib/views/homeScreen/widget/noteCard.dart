import 'package:flutter/material.dart';
import 'package:notes_app/views/noteViewScreen.dart';

class Notecard extends StatelessWidget {
  const Notecard({super.key, required this.title, required this.content});
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    NoteViewScreen(title: title, content: content),
              ));
        },
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                content,
                style: TextStyle(fontSize: 17),
              )
            ],
          ),
        ),
      ),
    );
  }
}
