import 'package:flutter/material.dart';

// Declaring StatefulWidget class called NotesPage
class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  // Overriding createState method to return an instance of _NotesPageState
  @override
  _NotesPageState createState() => _NotesPageState();
}

// Declaring State class called _NotesPageState
class _NotesPageState extends State<NotesPage> {
  List<String> _notes = [];

  TextEditingController _noteController = TextEditingController();

  // Defining a function named _addNote to add a note to _notes List
  void _addNote() {
    if (_noteController.text.isNotEmpty) {
      setState(() {
        _notes.add(_noteController.text);
        _noteController.clear();
      });
    }
  }

  // Defining a function named _deleteNoteAt to delete a note from _notes List
  void _deleteNoteAt(int index) {
    setState(() {
      _notes.removeAt(index);
    });
  }

  // Defining function named _editNoteAt to edit a note in _notes List
  void _editNoteAt(int index) {
    _noteController.text = _notes[index];
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Edit Note'),
        content: TextField(controller: _noteController),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _notes[index] = _noteController.text;
                _noteController.clear();
              });
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
          TextButton(
            onPressed: () {
              _noteController.clear();
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_notes[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () => _editNoteAt(index),
                        icon: Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () => _deleteNoteAt(index),
                        icon: Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _noteController,
                    decoration: InputDecoration(
                      hintText: 'Add Note',
                    ),
                    onSubmitted: (_) => _addNote(),
                  ),
                ),
                SizedBox(width: 9.0),
                IconButton(
                  onPressed: _addNote,
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
