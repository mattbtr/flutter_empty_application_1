import 'package:flutter/material.dart';
import 'add_notes_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatelessWidget{
  
  final List<String> dummyNotes = [
    'Einkaufsliste schreiben',
    'Projektbesprechung am Montag',
    'Flutter ausprobieren'
  ];  // Platzhalter-Daten, später ersetzen mit Cloud Firestore

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("My Notes")),
      body: StreamBuilder<QuerySnapshot>(

        stream: FirebaseFirestore.instance
        .collection('notes')
        .orderBy('timestamp', descending: true)
        .snapshots(),

      builder: (context, snapshot){
        // Ladeanzeige, wenn Daten geladen werden
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }
        // Leerer Zustand
        if(!snapshot.hasData || snapshot.data!.docs.isEmpty){
          return Center(child: Text('No Notes there'));
        }
        // Zugriff auf die Dokumente aus Firestore
        final notes = snapshot.data!.docs;

        // Liste aller Notizen anzeigen
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final noteData = notes[index].data() as Map<String, dynamic>;
            final text = noteData['text'] ?? 'Not found the note';

            return ListTile(
              title: Text(text)
            );
          },
        );

        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (_) => AddNoteScreen())  // Wechselt zur Eingabemaske
          );
        },
        child: Icon(Icons.add),
      ),
          );
  }
}