import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color.fromARGB(255, 246, 191, 215),
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          
          IconButton(
            icon: const Icon(Icons.home,size:35),
            color: currentIndex == 0 ? Colors.pink : const Color.fromARGB(255, 8, 8, 8),
            onPressed: () => onTap(0),
          ),
   
          Expanded(
            child: Container(
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              padding: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 240, 255, 248),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.pink),
                  hintText: 'Search...',
                  hintStyle: TextStyle(color: Color.fromARGB(66, 17, 17, 17),fontSize: 20),
                ),
                onTap: () {
                  // Handle the tap event
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
