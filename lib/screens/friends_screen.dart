import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Friends'),
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of friends
        itemBuilder: (context, index) {
          return ListTile(
            leading:
                Icon(Icons.person), // Replace with friend's avatar if available
            title: Text('Friend ${index + 1}'),
            subtitle: Text('Status of friend ${index + 1}'),
          );
        },
      ),
    );
  }
}
