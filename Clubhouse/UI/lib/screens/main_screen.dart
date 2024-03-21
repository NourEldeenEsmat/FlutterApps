import 'package:flutter/material.dart';

import '../components/custom_drawer.dart';
import '../components/following_users.dart';
import '../components/post_carosal.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  TabController? tabController;
  PageController? pageController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    pageController = PageController(initialPage: 0, viewportFraction: .8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'freeze',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 3,
          ),
        ),
        bottom: TabBar(
          controller: tabController,
          tabs: [
          Tab(
            text: 'trinding',
          ),
          Tab(
            text: 'Latest',
          )
        ],
        labelColor: Colors.blue[900],
          unselectedLabelColor: Colors.grey,
          labelStyle: TextStyle(
            color: Colors.green,
            fontSize: 30,
            fontWeight: FontWeight.w600
          ),
          unselectedLabelStyle: TextStyle(
              color: Colors.grey,
              fontSize: 15,
              fontWeight: FontWeight.w600
          ),

        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          // Text('data'),
          ListView(
            children: [
              FollowingUsers(),
              PostCarosal(pageController: pageController,),
            ],
          ),
          Container(
            color: Colors.blue[100],
          )
        ],
      ),
      drawer: CustomDrawer(),
    );
  }
}
