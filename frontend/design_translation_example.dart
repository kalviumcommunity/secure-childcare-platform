import 'package:flutter/material.dart';

// Simulating a Figma Design Spec
// Primary Color: #6200EE
// Font: Roboto (simulated)
// Button Radius: 8px
// Card Elevation: 4px

void main() => runApp(DesignSpecApp());

class DesignSpecApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        // Mapping Design Colors to Theme
        primaryColor: Color(0xFF6200EE),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF6200EE)),
        
        // Mapping Typography
        textTheme: TextTheme(
          headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
        ),
        
        // Mapping Element Shapes
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8), // Figma: 8px Radius
            ),
          ),
        ),
      ),
      home: DesignShowcase(),
    );
  }
}

class DesignShowcase extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Design to Code')),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Headline', style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 16),
            Text(
              'This text style matches the Body specs from Figma. It uses the correct font size and color opacity.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {}, 
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text('Primary Action'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
