import 'package:flutter/material.dart';

class BadgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Badges'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 20, // Replace with your actual number of badges
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text('Badge $index'), // Replace with your badge widget
            ),
          );
        },
      ),
    );
  }
}
