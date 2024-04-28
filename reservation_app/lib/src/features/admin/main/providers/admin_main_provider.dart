import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/admin/clubs/screens/manage_clubs_screen.dart';
import 'package:reservation_app/src/features/admin/dashboard/screens/dashboard_screen.dart';
import 'package:reservation_app/src/features/admin/reservation/screens/manage_reservations_screen.dart';
import 'package:reservation_app/src/features/admin/scoreboard/screens/manage_scoreboard_screen.dart';
import 'package:reservation_app/src/features/admin/tables/screens/manage_tables_screen.dart';

class AdminMainProvider extends ChangeNotifier {
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
      const DashboardScreen(),
      const ManageTablesScreen(),
      const ManageScoreboardScreen(),
      const ManageClubsScreen(),
      const ManageReservationsScreen(),
    ];
  }

  get screens => _buildScreens();

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset('assets/icons/dashboard_icon.svg',
            color: _currentIndex == 0
                ? AppColors.primaryColor
                : AppColors.textColor),
        title: ('Dashboard'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.chair),
        title: ('Tables'),
        activeColorSecondary: AppColors.primaryColor,
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
        icon: const Icon(FontAwesomeIcons.wineGlass),
        title: ('Clubs'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(FontAwesomeIcons.calendarDays),
        title: ('Reservations'),
        textStyle: const TextStyle(fontSize: 14),
        activeColorPrimary: AppColors.primaryColor,
        inactiveColorPrimary: AppColors.textColor,
      ),
    ];
  }

  List<PersistentBottomNavBarItem> get navBarsItems => _navBarsItems();
}
