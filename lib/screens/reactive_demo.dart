import 'package:flutter/material.dart';

class ReactiveDemo extends StatefulWidget {
  @override
  _ReactiveDemoState createState() => _ReactiveDemoState();
}

class _ReactiveDemoState extends State<ReactiveDemo> {
  // 1. STATE: Changing this data updates the UI
  Color _boxColor = Colors.blue;
  String _statusText = "Blue";
  int _counter = 0;

  void _toggleState() {
    // 2. SETSTATE: Tells Flutter "Rebuild the widget tree!"
    setState(() {
      if (_boxColor == Colors.blue) {
        _boxColor = Colors.green;
        _statusText = "Green";
      } else {
        _boxColor = Colors.blue;
        _statusText = "Blue";
      }
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // 3. WIDGET TREE: This hierarchy is rebuilt when setState is called
    return Scaffold(
      appBar: AppBar(title: Text("Widget Tree & Reactive UI")),
      body: Center(
        child: Column( // Parent Widget
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ // Child Widgets
            Text(
              "Tree Update Count: $_counter", 
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)
            ),
            SizedBox(height: 20),
            
            // A visual representation of a 'Node' in the tree
            Container(
              width: 150,
              height: 150,
              color: _boxColor,
              alignment: Alignment.center,
              child: Text(
                _statusText,
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            
            SizedBox(height: 30),
            
            ElevatedButton(
              onPressed: _toggleState,
              child: Text("Update State (rebuild tree)"),
            ),
          ],
        ),
      ),
    );
  }
}
