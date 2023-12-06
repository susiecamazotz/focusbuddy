import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Mute Notifications'),
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
        ],
      ),
    );
  }
}
