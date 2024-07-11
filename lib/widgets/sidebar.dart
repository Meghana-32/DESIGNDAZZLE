import 'package:flutter/material.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/screens/support_screen.dart';
import 'package:myapp/screens/login_screen.dart';
import 'package:myapp/screens/decor_items_screen.dart'; // Import the DecorItemsScreen
import 'package:myapp/widgets/login_bottom_sheet.dart'; // Import your login screen

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 245, 19, 155),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Color.fromARGB(234, 230, 245, 15),
                  size: 36,
                ),
                SizedBox(width: 10),
                Text(
                  'Meghana Rajulapati',
                  style: TextStyle(
                    color: Color.fromARGB(255, 248, 241, 241),
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            iconColor: Colors.deepOrange,
            leading: Icon(Icons.home),
            title: Text('Home'),
          ),
          ListTile(
            iconColor: Colors.cyan,
            leading: const Icon(Icons.account_circle),
            title: const Text('My Account'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          ListTile(
            iconColor: Colors.deepOrange,
            leading: const Icon(Icons.celebration_rounded),
            title: const Text('DecorItems'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DecorItemsScreen()),
              );
            },
          ),
          ListTile(
            iconColor: const Color.fromARGB(255, 57, 220, 111),
            leading: const Icon(Icons.support),
            title: const Text('Support'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SupportScreen()),
              );
            },
          ),
          const ListTile(
            iconColor: Colors.purple,
            leading: Icon(Icons.shopping_cart),
            title: Text('Orders'),
          ),
          ListTile(
            iconColor: Colors.red,
            leading: const Icon(Icons.logout_rounded),
            title: const Text('Logout'),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginBottomSheet()),
              );
            },
          ),
        ],
      ),
    );
  }
}
