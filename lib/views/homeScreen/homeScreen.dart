import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/views/homeScreen/widget/noteCard.dart';
import 'package:notes_app/views/noteScreen/noteScreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  var notebox = Hive.box("noteBox");
  List noteKeys = [];
  @override
  void initState() {
    noteKeys = notebox.keys.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Notescreen(),
                ));
          },
          child: Text("Add Note")),
      appBar: AppBar(
        title: Text(
          "Note App",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final note = notebox.get(noteKeys[index]);
            return Notecard(title: note["title"], content: note["content"]);
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: noteKeys.length),
    );
  }
}
