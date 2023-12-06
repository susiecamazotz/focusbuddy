import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  static const cozyGreen = Color(0xFF3D8361); // Define the cozy green color
  bool _muteNotifications = false;
  bool _darkMode = false;
  bool _dailyReminder = false;
  bool _is24HourFormat = true;
  String _language = 'English';

  // Add your initialization of local notifications here, if needed

  @override
=======

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
>>>>>>> origin/master
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
<<<<<<< HEAD
        backgroundColor: cozyGreen,
=======
>>>>>>> origin/master
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Mute Notifications'),
<<<<<<< HEAD
            value: _muteNotifications,
            onChanged: (bool value) {
              setState(() {
                _muteNotifications = value;
              });
              // Implement your notification muting logic here
            },
            activeColor: cozyGreen,
          ),
          SwitchListTile(
            title: const Text('Enable Dark Mode'),
            value: _darkMode,
            onChanged: (bool value) {
              setState(() {
                _darkMode = value;
              });
              // Implement your dark mode switching logic here
            },
            activeColor: cozyGreen,
          ),
          SwitchListTile(
            title: const Text('Daily Reminder'),
            value: _dailyReminder,
            onChanged: (bool value) {
              setState(() {
                _dailyReminder = value;
              });
              // Implement your daily reminder setting logic here
            },
            activeColor: cozyGreen,
          ),
          SwitchListTile(
            title: const Text('24-Hour Time Format'),
            value: _is24HourFormat,
            onChanged: (bool value) {
              setState(() {
                _is24HourFormat = value;
              });
              // Implement your time format change logic here
            },
            activeColor: cozyGreen,
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: Text(_language),
            onTap: () => _showLanguagePicker(context),
            trailing: Icon(Icons.arrow_forward_ios, color: cozyGreen),
          ),
          // Add more settings options here
=======
            value: true, // Replace with actual value
            onChanged: (bool value) {
              // Handle toggle switch
            },
          ),
          ListTile(
            title: const Text('Language'),
            subtitle: const Text('English'), // Replace with actual setting
            onTap: () {
              // Handle change language
            },
          ),
          // Add more settings here
>>>>>>> origin/master
        ],
      ),
    );
  }
<<<<<<< HEAD

  void _showLanguagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select a language'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('English'),
                  onTap: () {
                    _changeLanguage('English');
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: const Text('Español'),
                  onTap: () {
                    _changeLanguage('Español');
                    Navigator.of(context).pop();
                  },
                ),
                // Add more languages here
              ],
            ),
          ),
        );
      },
    );
  }

  void _changeLanguage(String language) {
    setState(() {
      _language = language;
    });
    // Implement your language change logic here
  }

  // Add more functions to handle other settings changes here
=======
>>>>>>> origin/master
}
