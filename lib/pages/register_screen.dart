import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterScreen extends StatelessWidget {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void register(BuildContext context) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        );
      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Resistration failed: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: const Text('Register'),),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child : Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: 'E-Mail'),),
            TextField(controller: passwordController, decoration: const InputDecoration(labelText: 'Passowrd'),),
            const SizedBox(height: 16,),
            ElevatedButton(onPressed: () => register(context), child: const Text("Register"))
            
          ],
        )
      )
    );
  }

}