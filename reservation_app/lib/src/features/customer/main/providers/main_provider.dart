import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/customer/chat/screens/chat_screen.dart';
import 'package:reservation_app/src/features/customer/explore/screens/explore_screen.dart';
import 'package:reservation_app/src/features/customer/home/screens/home_screen.dart';
import 'package:reservation_app/src/features/customer/profile/screens/profile_screen.dart';
import 'package:reservation_app/src/features/customer/scoreboard/screens/scoreboard_screen.dart';

class MainProvider extends ChangeNotifier {
  int _currentIndex = 0;

  final PersistentTabController _bottomNavController =
      PersistentTabController(initialIndex: 0);

  PersistentTabController get bottomNavController => _bottomNavController;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const ExploreScreen(),
      const ScoreboardScreen(),
      const ChatScreen(),
      const ProfileScreen(),
    ];
  }

  get screens => _buildScreens();

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.house),
        title: ('Home'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        title: ('Explore'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.trophy),
        title: ('Scoreboard'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.comment),
        title: ('Chat'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.user),
        title: ('Profile'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> get navBarsItems => _navBarsItems();
}
