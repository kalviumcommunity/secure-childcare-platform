import 'package:flutter/material.dart';
import 'screens/stateless_stateful_demo.dart';

void main() {
  runApp(StatelessStatefulApp());
}

class StatelessStatefulApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateless vs Stateful',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: StatelessStatefulDemo(),
    );
  }
}
