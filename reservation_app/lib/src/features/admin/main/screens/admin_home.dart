import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/admin/main/providers/admin_main_provider.dart';

class AdminMainScreen extends StatefulWidget {
  const AdminMainScreen({super.key});

  @override
  State<AdminMainScreen> createState() => _AdminMainScreenState();
}

class _AdminMainScreenState extends State<AdminMainScreen> {

  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      hideNavigationBar: !Provider.of<AdminMainProvider>(context).isBottomNavVisible,
      navBarHeight: 80,
      screens: Provider.of<AdminMainProvider>(context).screens,
      items: Provider.of<AdminMainProvider>(context).navBarsItems,
      confineInSafeArea: true,
      backgroundColor: AppColors.whiteColor,
      handleAndroidBackButtonPress: true,
      onItemSelected: (index) =>
          Provider.of<AdminMainProvider>(context, listen: false)
              .changeIndex(index),
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.textColor.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: -5,
            offset: const Offset(0, 0),
          )
        ],
      ),
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style4, // Choose the nav bar style with this property.
    );
  }
}
