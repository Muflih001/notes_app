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
    setState(() {});
    super.initState();
  }
  void deleteAllNotes() {
    notebox.clear(); // Clear the Hive box
    noteKeys.clear(); // Clear the note keys list
    setState(() {}); // Update the UI
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
      endDrawer: Drawer(
          backgroundColor: Colors.grey[900],
          child: SafeArea(
            child: Column(
              children: [
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: () {
                    // Handle home tap
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    // Handle settings tap
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(Icons.delete),
                  title: Text('Delete All Notes'),
                  onTap: () {
                    // Handle logout tap
                    deleteAllNotes();
                  },
                ),
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(Icons.help),
                  title: Text('Help'),
                  onTap: () {
                    // Handle help tap
                    Navigator.pop(context);
                  },
                ),
                Spacer(),
                ListTile(
                  iconColor: Colors.white,
                  textColor: Colors.white,
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () {
                    // Handle logout tap
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            final note = notebox.get(noteKeys[index]);
            return Notecard(title: note["title"], content: note["content"]);
          },
          separatorBuilder: (context, index) => SizedBox(
                height: 0,
              ),
          itemCount: noteKeys.length),
    );
  }
}
