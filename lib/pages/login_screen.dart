import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void login(BuildContext context) async {

    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(

        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login failed: $e')));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: 'E-Mail')),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Password'), obscureText: true),
            const SizedBox(height: 16,),
            ElevatedButton(onPressed: () => login(context), child: const Text('Login')),
            TextButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => RegisterScreen())), child: const Text('Noch kein Konto? Jetzt registrieren.'))

          ],
        )
        ),
    );

  }

}