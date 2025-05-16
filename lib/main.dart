import 'package:flutter/material.dart';   // import für Design UI-Toolkit von Flutter (Widgets, Themes etc.)
import 'package:flutter_empty_application_1/pages/auth_logic.dart';   // import der Authentication-Logik (zeigt Login oder HomeScrenn je Auth.status)
//import 'pages/home_screen.dart';
//import 'pages/add_notes_screen.dart';
import 'package:firebase_core/firebase_core.dart';  // Firebase Core Package für Firebase App in Flutter
import 'package:flutter_dotenv/flutter_dotenv.dart';

//import 'firebase_options.dart';   // enthält Firebase-Prohjekt-Konfiguration
import 'firebase_options_env.dart'; // ersetzt firebase_options.dart


void main() async {
  WidgetsFlutterBinding.ensureInitialized();  
  // Sorgt dafür, dass alle Widgets und Dienste bevor Firebase initialisiert wird.
  // Wichtig bei asynchronem Code wie Firebase.initializeApp() 

  // LADEN VON .env-Datei (enthält API-Keys und andere sensible Daten):
  await dotenv.load(fileName: '.env');

  // Firebase nur initialisieren, wenn es noch nicht initialisiert wurde
  try {
    if (Firebase.apps.isEmpty) {
      await Firebase.initializeApp(
        options: FirebaseOptionsEnv.currentPlatform,
      );
    }
  } catch (e) {
    print('Firebase init error: $e');
  }         // Firebase Projekt initialisieren aus der .env DAtei
    //options: DefaultFirebaseOptions.currentPlatform,
    
    // Verwendet nicht mehr die automatisch generierte Konfiguration
    // aus firebase_options.dart mit DefaultFirebaseOptions.currentPlatform!!!!
    // sondern aus firebase_options_env.dart mt FirebaseOptionsEnv.currentPlatform  !!!!

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authentification',
      theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.blue),   // Aktiviert das neuere Material Design 3 (MD3), primäre Theme-Farben
      home: AuthLogic(), // Startbildschirm ist die Authentifizierung
    );
  }
}
