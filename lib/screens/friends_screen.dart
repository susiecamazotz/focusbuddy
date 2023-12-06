import 'package:flutter/material.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Using the theme from theme.dart
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
      ),
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of friends
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:
                    theme.primaryColor, // Using theme primary color
                child:
                    Text('F${index + 1}'), // Placeholder for friend's initials
              ),
              title: Text('Friend ${index + 1}'),
              subtitle: Text('Status of friend ${index + 1}'),
              trailing: IconButton(
                icon: const Icon(Icons.message),
                color: theme.cardColor, // Using theme primary color
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
