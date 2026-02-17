import 'package:flutter/material.dart';
import 'screens/devtools_demo.dart';

void main() {
  runApp(DevToolsApp());
}

class DevToolsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DevTools Demo',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: DevToolsDemo(),
      debugShowCheckedModeBanner: false, // Cleaner UI
    );
  }
}
