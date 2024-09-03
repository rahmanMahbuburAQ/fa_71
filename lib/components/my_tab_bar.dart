import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({
    super.key,
    required this.tabController
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        controller: tabController,
        tabs: [
          //1st tab
          Tab(icon: Icon(Icons.camera_rear)),

          //2nd tab
          Tab(icon: Icon(Icons.pedal_bike)),

          //3rd tab
          Tab(icon: Icon(Icons.motorcycle)),


          //4th tab
          Tab(icon: Icon(Icons.car_repair)),

          //4th tab
          Tab(icon: Icon(Icons.shop)),


        ]

      ),
    );
  }
}
