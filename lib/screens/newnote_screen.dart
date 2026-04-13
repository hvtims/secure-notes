import 'package:flutter/material.dart';
import "../data/note_dao.dart";
import "../models/note.dart";
class NewnoteScreen extends StatefulWidget {
   NewnoteScreen({super.key});

  @override
  State<NewnoteScreen> createState() => _NewnoteScreenState();
}

class _NewnoteScreenState extends State<NewnoteScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();
  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Note'),
      ),
      body: Column(
        children: [
           Padding(
            padding: EdgeInsets.all(16.0),
             child :  TextField(
              controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Note Title',
                ),
              
              ),
            
          ),

             Padding(
              padding: EdgeInsets.all(16.0),
              child : TextField(
                controller: contentController,
                  decoration: InputDecoration(
                    labelText: 'Note Content',
                  ),
                  maxLines: 10,
                ),
              
            ),
              ElevatedButton(
                onPressed: () {
                  String title = titleController.text;
                  String content = contentController.text;
                  if (title.isNotEmpty && content.isNotEmpty) {
                    NoteDao.instance.addNote(Note(
                      id : null,
                      title: title,
                      description: content,
                    ));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Save Note'),
              ),
        ],
      ),
    );
  }
}