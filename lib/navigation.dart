import 'package:flutter/material.dart';
import 'screens/home_screen.dart'; // Make sure you have this screen created
import 'screens/badge_screen.dart'; // Make sure you have this screen created
import 'screens/statistics_screen.dart'; // Make sure you have this screen created
import 'screens/friends_screen.dart'; // Make sure you have this screen created
import 'screens/settings_screen.dart'; // Make sure you have this screen created

class NavigationScreen extends StatefulWidget {
  @override
  _NavigationScreenState createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    BadgeScreen(),
    StatisticsScreen(),
    FriendsScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Color(0xFFFFD700), // Selected item color
        unselectedItemColor: Color(0xFFC0C0C0), // Unselected item color
        backgroundColor: Color(0xFF6A5ACD), // Background color
        selectedIconTheme: IconThemeData(size: 35), // Selected icon size
        unselectedIconTheme: IconThemeData(size: 25), // Unselected icon size
        selectedLabelStyle: TextStyle(fontSize: 14), // Selected label style
        unselectedLabelStyle: TextStyle(fontSize: 12), // Unselected label style
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Fixed type for background color
      ),
    );
  }
}
