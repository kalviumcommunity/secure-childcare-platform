import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final AuthService _authService = AuthService();
  final FirestoreService _firestoreService = FirestoreService();

  void _signup() async {
    // 1. Create Auth User
    final user = await _authService.signUp(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (user != null) {
      // 2. Add Data to Firestore
      await _firestoreService.addUserData(
        user.uid,
        _emailController.text.trim(),
        _nameController.text.trim(),
      );
      
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Account Created!")));
      Navigator.pop(context); // Go back to login
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup Failed")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: "Full Name"),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _signup, child: Text("Sign Up")),
          ],
        ),
      ),
    );
  }
}
