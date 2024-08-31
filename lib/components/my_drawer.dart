import 'package:fa_71/components/my_drawer_tile.dart';
import 'package:fa_71/pages/settings_page.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
          MyDrawerTile(text: 'L o g o u t', icon: Icons.logout, onTap: (){}),
        ],
      )
    );
  }
}
