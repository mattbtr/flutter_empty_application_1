import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
//import 'pages/add_notes_screen.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Notes',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: HomeScreen(),
    );
  }
}
