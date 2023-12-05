// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/badge_screen.dart';
import 'screens/statistics_screen.dart';
import 'screens/friends_screen.dart';
import 'screens/settings_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  bool _isTimerRunning = false; // To track timer state

  List<Widget> _widgetOptions() {
    return <Widget>[
      HomeScreen(
        onTimerToggle: (isRunning) {
          setState(() {
            _isTimerRunning = isRunning;
          });
        },
      ),
      const BadgeScreen(),
      const StatisticsScreen(),
      const FriendsScreen(),
      const SettingsScreen(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _isTimerRunning
          ? null
          : BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/home_icon.png")),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/badge_icon.png")),
                  label: 'Badges',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/stats_icon.png")),
                  label: 'Statistics',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/friends_icon.png")),
                  label: 'Friends',
                ),
                BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/settings_icon.png")),
                  label: 'Settings',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              type: BottomNavigationBarType.fixed,
            ),
    );
  }
}
