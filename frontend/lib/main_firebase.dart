import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

// IMPORTANT: This main function requires Firebase configuration files to run.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(); // Uncomment this line after adding google-services.json
  
  runApp(FirebaseApp());
}

class FirebaseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Demo',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: LoginScreen(), // Start at Login
    );
  }
}
