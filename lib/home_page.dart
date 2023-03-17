import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_memo_app/models/note_data.dart';
import 'package:provider/provider.dart';

import 'editing_note_page.dart';
import 'models/note.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

    void createNewNote() {
      int id =
          Provider.of<NoteData>(context, listen: false).getAllNOtes().length;

      Note newNote = Note(
        id: id,
        text: '',
      );

      goToNotePage(newNote, true);
    }

    void goToNotePage(Note note, bool isNewNote) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditNotePage(
                    note: note,
                    isNewNote: false,
                  )));
    }


  void deleteNote(Note note) {
    Provider.of(context,listen: false).deleteNode(note);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NoteData>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: CupertinoColors.systemGroupedBackground,
              floatingActionButton: FloatingActionButton(
                onPressed: createNewNote,
                elevation: 0,
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.add,
                  color: Colors.grey,
                ),
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 24, top: 75),
                    child: Text(
                      'Notes',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CupertinoListSection.insetGrouped(
                      children: List.generate(
                    value.getAllNOtes().length,
                    (index) => CupertinoListTile(
                        title: Text(value.getAllNOtes()[index].text)),
                  )),
                ],
              ),
            ));
  }
}
