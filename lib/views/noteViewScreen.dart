import 'package:flutter/material.dart';

class NoteViewScreen extends StatefulWidget {
  const NoteViewScreen({super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  State<NoteViewScreen> createState() => _NoteViewScreenState();
}

class _NoteViewScreenState extends State<NoteViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Your Note',
            style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  widget.content,
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
          ),
        ));
  }
}
