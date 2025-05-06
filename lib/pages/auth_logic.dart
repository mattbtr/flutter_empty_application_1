import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'login_screen.dart';

class AuthLogic extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return StreamBuilder<User?> (
      stream: FirebaseAuth.instance.authStateChanges(), 
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator(),);
        } else if (snapshot.hasData){
          return HomeScreen();
        } else{
          return LoginScreen();
        }
      }
      
      );
  }

}