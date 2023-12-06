import 'package:flutter/material.dart';
// Import the chart library you decide to use

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  static const cozyGreen = Color(0xFF3D8361); // Define the cozy green color

  @override
  Widget build(BuildContext context) {
    // Replace this with your actual chart widget
    // For example, if you're using fl_chart, it could be BarChart(BarChartData(...))
    final Widget chartWidget = Container(
      height: 200, // Temporary height for the placeholder
      decoration: BoxDecoration(
        color: Colors.grey[200], // Temporary color for the placeholder
        borderRadius: BorderRadius.circular(18), // Slight rounding of corners
      ),
      alignment: Alignment.center,
      child: const Text('Your chart goes here'),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Statistics'),
        backgroundColor: cozyGreen, // Apply the cozy green theme to AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the chart
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Activity', // Title for your chart section
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: cozyGreen, // Use the cozy green for text
              ),
            ),
            const SizedBox(height: 20), // Space between title and chart
            chartWidget, // Your actual chart widget will go here
            // You can add more statistics widgets or information below
          ],
        ),
      ),
    );
  }
}
