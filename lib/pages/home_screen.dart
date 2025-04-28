import 'package:flutter/material.dart';
import 'add_notes_screen.dart';

class HomeScreen extends StatelessWidget{
  
  final List<String> dummyNotes = [
    'Einkaufsliste schreiben',
    'Projektbesprechung am Montag',
    'Flutter ausprobieren'
  ];

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("My Notes")),
      body: ListView.builder(
        itemCount: dummyNotes.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(dummyNotes[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(builder: (_) => AddNoteScreen())
          );
        },
        child: Icon(Icons.add),
      ),
          );
  }
}