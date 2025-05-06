import 'package:flutter/material.dart';
import 'pages/home_screen.dart';
//import 'pages/add_notes_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  // Sorgt dafür, dass alle Widgets und Dienste vor dem Start initialisiert sind.
  // Wichtig bei asynchronem Code wie Firebase.initializeApp() 
  await Firebase.initializeApp(         // Firebase Projekt initialisieren
    options: DefaultFirebaseOptions.currentPlatform,
    // Verwendet die automatisch generierte Konfiguration aus firebase_options.dart
    // (enthält u. a. API-Key, Projekt-ID etc.)
);

runApp(const MainApp());

}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Notes',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),
      home: HomeScreen(), // Startbildschirm ist die Notizübersicht
    );
  }
}
