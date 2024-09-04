import 'package:fa_71/components/my_drawer_tile.dart';
import 'package:fa_71/pages/login_page.dart';
import 'package:fa_71/pages/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyDrawer extends StatelessWidget {
  //const MyDrawer({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

 //log out function:
  void logout(BuildContext context) async {
    try {
      await _auth.signOut();
      // Navigate to the login page or any other page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));

      // Display a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('You Logged Out Successfully!'),
          backgroundColor: Colors.green, //
          duration: Duration(seconds: 2), // Duration for the snack bar to be visible
        ),
      );
      // Ensure '/login' is defined in your routes
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        // SnackBar(
        //   content: Text('Error logging out: ${e.toString()}'),
        // ),
        SnackBar(
          content: Text(
            'Error logging out: ${e.toString()}',
            style: TextStyle(fontSize: 16), // Adjust fontSize as needed
          ),
          backgroundColor: Colors.red, // Optional: change the background color
          duration: Duration(seconds: 3), // Optional: change the duration
        ),
      );
    }
  }




  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          //app logo
          Padding(
          padding: EdgeInsets.only(top: 90),
          child: Icon(
            Icons.add_shopping_cart_sharp,
            size: 65,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
    ),

          Padding(
            padding: EdgeInsets.all(30),
            child: Divider(
              color:Theme.of(context).colorScheme.secondary,
            )
          ),



          //home list tile
          MyDrawerTile(text: 'H o m e', icon: Icons.home, onTap: ()=> Navigator.pop(context)),

          //settings list tile
          MyDrawerTile(
              text: 'S e t t i n g s',
              icon: Icons.settings,
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> const SettingsPage()),
                );
              }
              ),


          const Spacer(),
          //logout list tile
          MyDrawerTile(text: 'L o g o u t', icon: Icons.logout, onTap: ()=> logout(context)),
        ],
      )
    );
  }
}
