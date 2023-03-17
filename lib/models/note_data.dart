import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:new_memo_app/models/note.dart';

class NoteData extends ChangeNotifier {
  List<Note> allNotes = [
    Note(id: 0, text: 'First  Note'),
    Note(id: 1, text: 'Second  Note'),
  ];

  List<Note> getAllNOtes() {
    return allNotes;
  }

  void addNewNote(Note note) {
    allNotes.add(note);
    notifyListeners();
  }

  void updateNote(Note note, String text) {
    for (int i = 0; i < allNotes.length; i++) {
      if (allNotes[i].id == note.id) {
        allNotes[i].text = text;
      }
    }
    notifyListeners();
  }

  void  deleteNode(Note note) {
    allNotes.remove(note);
    notifyListeners();
  }
}