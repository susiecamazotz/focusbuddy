import 'package:flutter/material.dart';

import '../theme.dart';
import 'screens/home_screen.dart';
import 'screens/badge_screen.dart';
import 'screens/statistics_screen.dart';
import 'screens/friends_screen.dart';
import 'screens/settings_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  bool _isTimerRunning = false;

  static const Color cozyGreen = Color(0xFF3D8361);

  List<Widget> _widgetOptions() {
    return <Widget>[
      HomeScreen(onTimerToggle: _handleTimerToggle),
      const BadgeScreen(),
      const StatisticsScreen(),
      const FriendsScreen(),
      const SettingsScreen(),
    ];
  }

  void _handleTimerToggle(bool isRunning) {
    setState(() {
      _isTimerRunning = isRunning;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  BottomNavigationBarItem _buildNavItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _widgetOptions().elementAt(_selectedIndex),
      ),
      bottomNavigationBar: _isTimerRunning
          ? null
          : BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                _buildNavItem(Icons.home, 'Home'),
                _buildNavItem(Icons.badge, 'Badges'),
                _buildNavItem(Icons.bar_chart, 'Statistics'),
                _buildNavItem(Icons.people, 'Friends'),
                _buildNavItem(Icons.settings, 'Settings'),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              selectedItemColor:
                  Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
              unselectedItemColor: Theme.of(context)
                  .bottomNavigationBarTheme
                  .unselectedItemColor,
            ),
    );
  }
}
