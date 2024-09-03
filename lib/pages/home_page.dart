import 'package:fa_71/components/my_current_location.dart';
import 'package:fa_71/components/my_description_box.dart';
import 'package:fa_71/components/my_drawer.dart';
import 'package:fa_71/components/my_sliver_app_bar.dart';
import 'package:fa_71/components/my_tab_bar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  //tab controller:
  late TabController _tabController;

  @override
  void initState(){
    super.initState();
    _tabController = TabController(length:5, vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  //my current location:
                  MyCurrentLocation(),



                  //descriotion box
                  MyDescriptionBox(),
                  SizedBox (height: 25),
                ],
              ),
          ),
        ],
        body: TabBarView(
          controller: _tabController,
          children: [
            ListView.builder(itemCount:10, itemBuilder: (context, index) => Text('Cars')),
            ListView.builder(itemCount:10, itemBuilder: (context, index) => Text('Bi-cycle')),
            ListView.builder(itemCount:10, itemBuilder: (context, index) => Text('Motorcycles')),
            ListView.builder(itemCount:10, itemBuilder: (context, index) => Text('Car wash')),
            ListView.builder(itemCount:10, itemBuilder: (context, index) => Text('Bags')),
          ],
        )
      )
    );
  }
}
