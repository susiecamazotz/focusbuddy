import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  static const cozyGreen = Color(0xFF3D8361); // Define the cozy green color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        backgroundColor: cozyGreen, // Apply the cozy green theme to AppBar
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of friends
        itemBuilder: (context, index) {
          return Card(
            // Wrap ListTile with a Card for better visual separation
            margin: const EdgeInsets.symmetric(
                vertical: 4, horizontal: 8), // Card margin
            child: ListTile(
              leading: CircleAvatar(
                // Use a CircleAvatar for the friend's avatar
                backgroundColor: cozyGreen,
                child:
                    Text('F${index + 1}'), // Placeholder for friend's initials
              ),
              title: Text('Friend ${index + 1}'),
              subtitle: Text('Status of friend ${index + 1}'),
              trailing: IconButton(
                // An icon button to initiate chat or similar action
                icon: const Icon(Icons.message),
                color: cozyGreen,
                onPressed: () {
                  // Implement your messaging logic here
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
