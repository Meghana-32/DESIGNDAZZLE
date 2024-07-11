import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final VoidCallback onNotificationTap;
  final VoidCallback onLoginTap;
  final String subtitle;

  const CustomAppBar({
    required this.title,
    required this.backgroundColor,
    required this.scaffoldKey,
    required this.onNotificationTap,
    required this.onLoginTap,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor:Color.fromARGB(255, 241, 163, 189),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          Text(subtitle, style: const TextStyle(fontSize: 14)),
        ],
      ),
      
      actions: [
        IconButton(
          icon: const Icon(Icons.notification_important_rounded,
          color: Colors.yellow,
          ),
          onPressed: onNotificationTap,
        ),
        TextButton(onPressed: onLoginTap,
                 style: TextButton.styleFrom(
                  backgroundColor: Colors.blue),
                  child: const Text('Login',
                  style: TextStyle(
                    color: Color.fromARGB(255, 212, 240, 213)
                  ),),
        ),
       
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
