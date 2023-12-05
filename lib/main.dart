import 'package:flutter/material.dart';
import 'theme.dart'; // Import theme.dart where appThemeData is defined
import 'navigation.dart'; // Import navigation.dart where NavigationScreen is defined

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Focus Buddy',
      theme: appThemeData, // Use the theme data defined in theme.dart
      home: const NavigationScreen(), // Root widget with bottom navigation
    );
  }
}
