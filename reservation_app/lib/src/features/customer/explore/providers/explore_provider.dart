import 'package:flutter/material.dart';
import 'package:reservation_app/src/features/customer/explore/widgets/clubs_view.dart';

import '../widgets/tables_view.dart';

class ExploreProvider extends ChangeNotifier {
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  void changeTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  List<StatefulWidget> buildTabViews() {
    return [
      const TablesView(),
      const ClubsView(),
    ];
  }
}
