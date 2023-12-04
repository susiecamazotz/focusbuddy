import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Mute Notifications'),
            value: true, // Replace with actual value
            onChanged: (bool value) {
              // Handle toggle switch
            },
          ),
          ListTile(
            title: Text('Language'),
            subtitle: Text('English'), // Replace with actual setting
            onTap: () {
              // Handle change language
            },
          ),
          // Add more settings here
        ],
      ),
    );
  }
}
