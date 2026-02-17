import 'package:flutter/material.dart';

void main() {
  runApp(ResponsiveApp());
}

class ResponsiveApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ResponsiveDashboard(),
    );
  }
}

class ResponsiveDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Media Query: Get screen size
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: Text('Responsive Dashboard')),
      body: screenWidth < 600
          ? _buildMobileLayout() // Phone: Single Column
          : _buildTabletLayout(), // Tablet/Web: Row + Column
    );
  }

  // Mobile Layout: Stacks elements vertically
  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildSummaryCard(),
          _buildTaskList(),
        ],
      ),
    );
  }

  // Tablet Layout: Side-by-side view
  Widget _buildTabletLayout() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: _buildSummaryCard(),
        ),
        Expanded(
          flex: 2,
          child: _buildTaskList(),
        ),
      ],
    );
  }

  Widget _buildSummaryCard() {
    return Card(
      margin: EdgeInsets.all(16),
      color: Colors.blueAccent,
      child: Container(
        padding: EdgeInsets.all(32),
        width: double.infinity,
        child: Column(
          children: [
            Text('Welcome Back!',
                style: TextStyle(fontSize: 24, color: Colors.white)),
            Text('You have 5 pending tasks.',
                style: TextStyle(color: Colors.white70)),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      shrinkWrap: true, // Needed for embedded ListView
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: ListTile(
            leading: CircleAvatar(child: Text('${index + 1}')),
            title: Text('Task Item ${index + 1}'),
            subtitle: Text('This is a responsive list item.'),
          ),
        );
      },
    );
  }
}
