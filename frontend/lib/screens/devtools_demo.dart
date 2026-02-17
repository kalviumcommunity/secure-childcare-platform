import 'package:flutter/material.dart';

class DevToolsDemo extends StatefulWidget {
  @override
  _DevToolsDemoState createState() => _DevToolsDemoState();
}

class _DevToolsDemoState extends State<DevToolsDemo> {
  int _counter = 0;
  
  // Method to demonstrate Logging
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    // 1. DEBUG CONSOLE: This will appear in your IDE's Debug Console or Terminal
    debugPrint("Current Counter Value: $_counter");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hot Reload & DevTools Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 2. HOT RELOAD TASK: Change this text while the app is running!
            //    e.g., Change "Hello" to "Welcome" and press Hot Reload (⚡).
            Text(
              "Modify this text in source code!", 
              style: TextStyle(fontSize: 20),
            ),
            
            SizedBox(height: 20),
            
            Text(
              'Count: $_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            
            SizedBox(height: 20),
            
            ElevatedButton(
              onPressed: _incrementCounter,
              child: Text("Log to Console"),
            ),
            
            // 3. WIDGET INSPECTOR: Deeply nested widget to find in DevTools!
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              color: Colors.blue[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.bug_report),
                  SizedBox(width: 10),
                  Text("Inspect me in DevTools!"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
