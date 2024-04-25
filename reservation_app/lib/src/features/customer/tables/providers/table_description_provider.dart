import 'package:flutter/material.dart';

class TableDescriptionProvider extends ChangeNotifier {

  int _selectedSeatsCount = 0;

  int get selectedSeatsCount => _selectedSeatsCount;

  void incrementSelectedSeatsCount() {
    _selectedSeatsCount++;
    notifyListeners();
  }

  void decrementSelectedSeatsCount() {
    _selectedSeatsCount--;
    notifyListeners();
  }



}