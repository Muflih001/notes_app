import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class Notescreen extends StatefulWidget {
  const Notescreen({super.key});

  @override
  State<Notescreen> createState() => _NotescreenState();
}

class _NotescreenState extends State<Notescreen> {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  var notebox = Hive.box("notebox");
  List noteKeys = [];
  @override
  void initState() {
    noteKeys = notebox.keys.toList();
    setState(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Create Notes',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: TextButton(
          onPressed: () {
            notebox.add({
              "title": _titleController.text,
              "content": _descriptionController.text
            });
            noteKeys = notebox.keys.toList();

            Navigator.pop(context);
            setState(() {});
          },
          child: Text('Save Note'),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Title',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  controller: _titleController,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  maxLines: null,
                  decoration: InputDecoration(
                      labelText: 'Content',
                      border: OutlineInputBorder(borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some content';
                    }
                    return null;
                  },
                  controller: _descriptionController,
                )
              ],
            ),
          ),
        ));
  }
}
