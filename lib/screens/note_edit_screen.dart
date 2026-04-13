import 'package:flutter/material.dart';
import 'package:secure_notes/models/note.dart';
import "package:secure_notes/data/note_dao.dart";

class NoteEditScreen extends StatefulWidget {
  final Note note;
  const NoteEditScreen({super.key, required this.note});

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.description);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Note')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Note Title'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: contentController,
              decoration: const InputDecoration(labelText: 'Note Content'),
              maxLines: 10,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              String title = titleController.text;
              String content = contentController.text;

              if (title.isNotEmpty && content.isNotEmpty) {
                final updatedNote = Note(
                  id: widget.note.id, 
                  title: title,
                  description: content,
                );

                await NoteDao.instance.update(updatedNote);

                Navigator.pop(context, true);
              }
            },
            child: const Text('Update Note'),
          ),
        ],
      ),
    );
  }
}
