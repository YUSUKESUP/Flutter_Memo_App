import 'dart:ffi';

import 'package:flutter/widgets.dart';
import 'package:new_memo_app/data/hive_data.dart';
import 'package:new_memo_app/models/note.dart';

class NoteData extends ChangeNotifier {

  final db = HiveDatabase();

  List<Note> allNotes = [];

  void initializeNotes() {
    allNotes = db.loadNotes();
  }

  List<Note> getAllNotes() {
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