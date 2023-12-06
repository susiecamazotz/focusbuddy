import 'package:flutter/material.dart';

class BadgeScreen extends StatelessWidget {
  const BadgeScreen({super.key});

  // Define the cozy green color for consistent theme
  static const cozyGreen = Color(0xFF3D8361);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badges'),
        backgroundColor: cozyGreen, // Apply the cozy green theme to AppBar
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8), // Add some padding for aesthetics
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8, // Spacing between the badges horizontally
          mainAxisSpacing: 8, // Spacing between the badges vertically
        ),
        itemCount: 20, // Replace with your actual number of badges
        itemBuilder: (context, index) {
          // Use Card to display each badge with some elevation for depth
          return Card(
            color: Colors.white, // Card background color
            elevation: 4, // Shadow depth for 3D effect
            child: Center(
              // Replace with your badge widget
              child: Padding(
                padding: const EdgeInsets.all(8), // Padding inside the card
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Placeholder for badge icon, replace with actual badge icon
                    Icon(Icons.star_border, size: 48, color: cozyGreen),
                    Text(
                      'Badge $index',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: cozyGreen, // Apply the cozy green theme to text
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
