import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/admin/clubs/screens/manage_clubs_screen.dart';
import 'package:reservation_app/src/features/super%20admin/admins/screens/manage_admins.dart';

import '../../clubs/screens/manage_clubs_screen.dart';

class SuperAdminProvider extends ChangeNotifier {
  int _currentIndex = 0;
  bool _isBottomNavVisible = true;

  final PersistentTabController _bottomNavController =
      PersistentTabController(initialIndex: 0);

  PersistentTabController get bottomNavController => _bottomNavController;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setBottomNavVisibility(bool isVisible) {
    _isBottomNavVisible = isVisible;
    notifyListeners();
  }

  bool get isBottomNavVisible => _isBottomNavVisible;

  List<Widget> _buildScreens() {
    return [
      const ManageAdminScreen(),
      const ManageClubScreen(),
    ];
  }

  get screens => _buildScreens();

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.user),
        title: ('Admins'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.wineGlass),
        title: ('Clubs'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> get navBarsItems => _navBarsItems();
}
