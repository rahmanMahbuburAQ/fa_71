import 'package:fa_71/components/bottom_nav_bar.dart';
import 'package:fa_71/pages/cart_page.dart';
import 'package:fa_71/pages/cart_page2.dart';
import 'package:fa_71/pages/shop_page2.dart';
import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {

  //the selected index is to control the bottom nav bar
  int _selectedIndex = 0;

  //this method will update our selected index
  //when the user taps on the bottom bar
  void navigationBottomBar(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  //page to display:
  final List<Widget> _pages = [
    //shop page
    const ShopPage2(),
    //cart page
    const CartPage2()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavbar(
        onTabChange: (index) => navigationBottomBar(index),
      ),
      // appBar: AppBar(
      //   backgroundColor: Colors.redAccent,
      //   elevation: 0,
      // ),
      body: _pages[_selectedIndex],
    );
  }
}
