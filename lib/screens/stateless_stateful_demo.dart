import 'package:flutter/material.dart';

class StatelessStatefulDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Stateless vs Stateful")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. STATELESS WIDGET: Static content
            StatelessHeader(title: "This is a Static Header"),
            
            SizedBox(height: 30),
            
            // 2. STATEFUL WIDGET: Interactive content
            StatefulCounter(),
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// A. Stateless Widget
// ---------------------------------------------------------------------------
// Use when the UI does NOT change after being built (e.g., static text, icons).
class StatelessHeader extends StatelessWidget {
  final String title;

  const StatelessHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[300],
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// B. Stateful Widget
// ---------------------------------------------------------------------------
// Use when the UI MUTATES or CHANGES based on user interaction or data.
class StatefulCounter extends StatefulWidget {
  @override
  _StatefulCounterState createState() => _StatefulCounterState();
}

class _StatefulCounterState extends State<StatefulCounter> {
  int _count = 0;
  bool _isActive = false;

  void _increment() {
    setState(() {
      _count++;
      _isActive = !_isActive; // Toggle color on each click
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("I am Dynamic!"),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: _isActive ? Colors.green : Colors.orange,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            'Count: $_count',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _increment,
          child: Text("Change My State"),
        )
      ],
    );
  }
}
