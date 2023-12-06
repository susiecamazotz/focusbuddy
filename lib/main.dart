import 'package:flutter/material.dart';
import 'screens/login_screen.dart'; // Import the LoginScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Focus Buddy',
      home: LoginScreen(), // Start with the LoginScreen
      // Removed theme: appThemeData
    );
  }
}
