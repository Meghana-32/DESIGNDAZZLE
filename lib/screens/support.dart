import 'package:flutter/material.dart';
import 'package:myapp/screens/support.dart';
import 'package:myapp/widgets/sidebar.dart';

class SupportScreen extends StatelessWidget {
  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.account_circle,
              size: 100, // Big icon size
            ),
            const SizedBox(height: 20), // Space between icon and text
            const Text(
              'Profile',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20), // Space between text and text fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Review your experience',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    decoration: InputDecoration(
                      hintText: 'Other suggestions',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Handle button press (e.g., submit feedback)
                      // This is where you would handle the logic for submitting feedback
                      // For now, it's left empty
                    },
                    child: const Text('Rate and give 5 stars'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


