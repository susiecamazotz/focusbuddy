import 'package:flutter/material.dart';
import 'theme.dart'; // Make sure the path to theme.dart is correct
import 'navigation.dart'; // Make sure the path to navigation.dart is correct

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: appThemeData, // Make sure this is defined in theme.dart
      home: NavigationScreen(), // Root widget with bottom navigation
    );
  }
}
