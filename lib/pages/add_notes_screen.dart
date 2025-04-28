import 'package:flutter/material.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  AddNoteScreenState createState() => AddNoteScreenState();
}

class AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _controller = TextEditingController();

  void _saveNote(){
    final text = _controller.text;
    if(text.isNotEmpty){
      // ToDo: Firebase speichern oder an verherige Stie zurückgeben
      Navigator.pop(context); // Zurück zur Liste
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("New Note")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: 'What do yout want to note?',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _saveNote,
              child: Text('Save'),
            )
          ],
        ),
      ),
    );
  }
}