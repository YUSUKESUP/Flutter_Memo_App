import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:new_memo_app/models/note_data.dart';
import 'package:provider/provider.dart';

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

  QuillController _controller = QuillController.basic();

  @override
  void initSate() {
    super.initState();
    loadExistingNote();
  }

  void loadExistingNote() {
    final doc = Document()..insert(0,widget.note.text);
    setState(() {
      _controller = QuillController(document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  void addNewNote() {

    int id = Provider.of<NoteData>(context, listen: false).getAllNotes().length;

    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false).addNewNote(
      Note(id: id, text: text),
    );
  }

  void updateNote() {
    String text = _controller.document.toPlainText();
    Provider.of<NoteData>(context, listen: false).updateNote(widget.note,text);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: (){
            if (widget.isNewNote && !_controller.document.isEmpty()) {
              addNewNote();
            }
            else {
              updateNote();
            }
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          QuillToolbar.basic(
            controller: _controller,
            showAlignmentButtons:false,
            showBackgroundColorButton: false,
            showCenterAlignment: false,
            showColorButton: false,
            showCodeBlock: false,
            showDirection: false,
            showFontFamily: false,
            showDividers: false,
            showIndent: false,
            showHeaderStyle: false,
            showLink: false,
            showSearchButton: false,
            showInlineCode: false,
            showQuote: false,
            showListNumbers: false,
            showListBullets: false,
            showClearFormat: false,
            showBoldButton: false,
            showFontSize: false,
            showItalicButton: false,
            showUnderLineButton: false,
            showStrikeThrough: false,
            showListCheck: false,
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.all(24),
            child: QuillEditor.basic(controller: _controller, readOnly: false,

                ),
          ))
        ],
      ),
    );
  }
}
