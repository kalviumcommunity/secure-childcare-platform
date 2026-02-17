import 'package:flutter/material.dart';
import 'screens/responsive_home.dart';

void main() {
  runApp(ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive UI Demo',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.indigo,
      ),
      home: ResponsiveHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
