import 'package:flutter/material.dart';
import 'package:reservation_app/src/features/customer/scoreboard/screens/global_scoreboard_view.dart';
import 'package:reservation_app/src/features/customer/scoreboard/screens/local_scoreboard_view.dart';

class ScoreboardProvider extends ChangeNotifier {
  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  List<Widget> buildTabViews() {
    return <Widget>[
      const GlobalScoreboardView(),
      const LocalScoreboardView(),
    ];
  }
}
