import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyBottomNavbar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 17,
        gap:1,
        onTabChange: (value) => onTabChange!(value),
        tabs: const [
          GButton(
              icon: Icons.home,
              text: 'Courses'
          ),
          GButton(
              icon: Icons.shopping_cart_sharp,
              text: 'My Cart'
          ),
        ],
      )

    );
  }
}
