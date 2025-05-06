import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddNoteScreen extends StatefulWidget {
  const AddNoteScreen({super.key});

  @override
  AddNoteScreenState createState() => AddNoteScreenState();
}

class AddNoteScreenState extends State<AddNoteScreen> {
  final TextEditingController _controller = TextEditingController();

  void _saveNote() async {
    final text = _controller.text;
    if(text.isNotEmpty){
      // ToDo: Notiz abn Firebase schicken und in Firebase speichern 
      await FirebaseFirestore.instance.collection('notes').add({
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
      });
      Navigator.pop(context); // schließt das aktuelle Fenster -->kehrt zurück zur Liste
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