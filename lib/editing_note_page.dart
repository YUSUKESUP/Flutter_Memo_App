import 'package:flutter/material.dart';

import 'models/note.dart';

class EditNotePage extends StatefulWidget {
  Note note;
  bool isNewNote;

  EditNotePage({Key? key, required this.note, required this.isNewNote})
      : super(key: key);

  @override
  State<EditNotePage> createState() => _EditNotePageState();
}

class _EditNotePageState extends State<EditNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
