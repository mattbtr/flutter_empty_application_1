import 'package:flutter/material.dart';
import 'add_notes_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatelessWidget{
  /*
  //final List<String> dummyNotes = [
    'Einkaufsliste schreiben',
    'Projektbesprechung am Montag',
    'Flutter ausprobieren'
  ];  // Platzhalter-Daten, später ersetzen mit Cloud Firestore
  */

  void logout(){
    print("Aktuelle UID: ${FirebaseAuth.instance.currentUser?.uid}");
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build (BuildContext context){

    final userEmail = FirebaseAuth.instance.currentUser?.email?? 'Unbekannt';
    final user = FirebaseAuth.instance.currentUser;
    

    return Scaffold(

      appBar: AppBar(
        title: Text("My Notes"),
        actions: [
          IconButton(onPressed: logout, icon: const Icon(Icons.logout))
        ],
        ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Welcome, $userEmail',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),

          Expanded(child: StreamBuilder<QuerySnapshot>(

            stream: FirebaseFirestore.instance
              .collection('notes')
              .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
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
            ),
        ],
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