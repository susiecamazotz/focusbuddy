import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primarySwatch: Colors.blue,
  colorScheme: ColorScheme.fromSwatch().copyWith(
    primary: Colors.blue, // primary color for the app
    secondary:
        Colors.amber, // used for the FloatingActionButtons and other elements
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: Color(0xFFFFD700),
    unselectedItemColor: Color(0xFFC0C0C0),
    backgroundColor: Color(0xFF6A5ACD),
    selectedIconTheme: IconThemeData(size: 35),
    unselectedIconTheme: IconThemeData(size: 25),
    selectedLabelStyle: TextStyle(fontSize: 14),
    unselectedLabelStyle: TextStyle(fontSize: 12),
  ),
  fontFamily: 'Georgia', // Specify your font here
  scaffoldBackgroundColor: const Color(0xFFFFFAF0), // Light warm color
  appBarTheme: const AppBarTheme(
    color: Colors.blue,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20.0,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: Colors.white, // Adjust icon colors if needed
    ),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14.0, fontFamily: 'Georgia'),
  ),

  // Button themeRR
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.orange[400],
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20.0),
    ),
  ),
  // Card theme
  cardTheme: CardTheme(
    color: Colors.white,
    shadowColor: Colors.orange.shade100,
    elevation: 5,
    margin: const EdgeInsets.all(10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
  ),
  // Floating Action Button theme
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.orange[600],
    foregroundColor: Colors.white,
  ),
  // Define other theme properties you need
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
