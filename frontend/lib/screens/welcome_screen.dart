import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // State variable to track toggle status
  bool _isWelcomeMessageVisible = true;

  void _toggleMessage() {
    setState(() {
      _isWelcomeMessageVisible = !_isWelcomeMessageVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sprint 2: Flutter Basics'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image or Icon
            Icon(
              Icons.rocket_launch,
              size: 100,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 32),
            
            // Text that changes based on state
            Text(
              _isWelcomeMessageVisible
                  ? 'Welcome to Flutter!'
                  : 'You toggled the state! 🚀',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              'This simple UI demonstrates widgets, layout, and state management.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 48),

            // Custom Button from widgets/ folder
            CustomButton(
              text: 'Click Me!',
              onPressed: _toggleMessage,
            ),
          ],
        ),
      ),
    );
  }
}
