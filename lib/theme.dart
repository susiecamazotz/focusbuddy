import 'package:flutter/material.dart';

// Define the new colors
const Color snowDrift = Color(0xFFF2F6F1);
const Color blackPearl = Color(0xFF041C2C);
const Color hippieBlue = Color(0xFF6CA2B8);
const Color bismark = Color(0xFF417086);
const Color wedgewood = Color(0xFF51869F);
const Color blueDianne = Color(0xFF264F67);
const Color blueDianne2 = Color(0xFF204255);
const Color riverBed = Color(0xFF465257);
const Color elephant = Color(0xFF13334C);
const Color ivory = Color(0xFFFFFFF2);

final ThemeData appThemeData = ThemeData(
  cardColor: snowDrift,
  primaryColor: blueDianne, // Using blue Dianne as an example for primary color
  scaffoldBackgroundColor: blackPearl,
  brightness: Brightness.dark,
  primarySwatch:
      Colors.blue, // Consider creating a swatch for one of the new colors
  visualDensity: VisualDensity.adaptivePlatformDensity,

  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: hippieBlue),
  ),

  appBarTheme: const AppBarTheme(
    color: Colors.transparent,
  ),

  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedItemColor: bismark,
    unselectedItemColor: riverBed,
  ),

  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: blueDianne2,
  ),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(
      color: blackPearl,
    ),
    bodyMedium: TextStyle(
      color: elephant,
    ),
    labelLarge: TextStyle(
      color: ivory,
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: snowDrift,
      backgroundColor: hippieBlue,
    ),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: riverBed),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: blackPearl),
    ),
    labelStyle: TextStyle(color: wedgewood),
  ),

  // Any other common theme attributes you'd like to define
);
