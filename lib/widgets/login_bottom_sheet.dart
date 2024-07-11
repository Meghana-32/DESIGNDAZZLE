import 'package:flutter/material.dart';
//import 'package:myapp/screens/accounts.dart';
import 'package:myapp/widgets/sidebar.dart';

class LoginBottomSheet extends StatelessWidget {
  const LoginBottomSheet({super.key});

  void _handleLogin(BuildContext context) {
    // Perform your login logic here

    // Navigate to MyAccountsScreen after successful login
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const SideBar()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const TextField(
            decoration: InputDecoration(
              labelText: 'Username',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _handleLogin(context);
            },
            child: const Text('Login'),
          ),
        ],
      ),
    );
  }
}
