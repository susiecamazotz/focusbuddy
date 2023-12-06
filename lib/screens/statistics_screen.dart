import 'package:flutter/material.dart';

// Import the chart library you decide to use

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  static const cozyGreen = Color(0xFF3D8361);

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual chart widget
    final Widget chartWidget = Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(18),
      ),
      alignment: Alignment.center,
      child: const Text('Your chart goes here'),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: cozyGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Your Activity',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: cozyGreen,
              ),
            ),
            const SizedBox(height: 20),
            chartWidget, // Your actual chart widget will go here
            // You can add more statistics widgets or information below
          ],
        ),
      ),
    );
  }
}
