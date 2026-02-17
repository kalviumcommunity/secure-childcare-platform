import 'package:flutter/material.dart';
import 'screens/reactive_demo.dart';

void main() {
  runApp(ReactiveApp());
}

class ReactiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reactive UI Demo',
      theme: ThemeData(primarySwatch: Colors.purple),
      home: ReactiveDemo(),
    );
  }
}
