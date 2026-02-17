import 'package:flutter/material.dart';

class ResponsiveHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 1. Get Screen Size
    var size = MediaQuery.of(context).size;
    var screenWidth = size.width;
    
    // 2. Define Breakpoint
    bool isTabletOrDesktop = screenWidth > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text('Responsive Layout Demo'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        elevation: 0,
      ),
      body: isTabletOrDesktop
          ? _buildTabletLayout(screenWidth) // Use Row for wider screens
          : _buildMobileLayout(), // Use Column for narrower screens
    );
  }

  // Mobile: Vertical Stack
  Widget _buildMobileLayout() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildHeaderSection("Mobile View"),
          _buildContentGrid(crossAxisCount: 2), // 2 items per row
          _buildFooterSection(),
        ],
      ),
    );
  }

  // Tablet/Desktop: Horizontal Split
  Widget _buildTabletLayout(double width) {
    return Row(
      children: [
        // Sidebar Navigation
        NavigationRail(
          selectedIndex: 0,
          onDestinationSelected: (int index) {},
          labelType: NavigationRailLabelType.selected,
          destinations: [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
        ),
        VerticalDivider(thickness: 1, width: 1),
        
        // Main Content Area
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeaderSection("Tablet / Desktop View ($width px)"),
                _buildContentGrid(crossAxisCount: 4), // 4 items per row
                _buildFooterSection(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeaderSection(String title) {
    return Container(
      padding: EdgeInsets.all(32),
      color: Colors.indigo[50],
      child: Column(
        children: [
          Icon(Icons.devices, size: 64, color: Colors.indigo),
          SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          Text('Resize window to see layout change!'),
        ],
      ),
    );
  }

  Widget _buildContentGrid({required int crossAxisCount}) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(), // Scroll handled by parent
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 8,
      padding: EdgeInsets.all(16),
      itemBuilder: (context, index) {
        return Card(
          color: Colors.white,
          elevation: 2,
          child: Center(
            child: Text('Item ${index + 1}', style: TextStyle(fontSize: 18)),
          ),
        );
      },
    );
  }

  Widget _buildFooterSection() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.grey[200],
      child: Center(child: Text('© 2026 Responsive App')),
    );
  }
}
