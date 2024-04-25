import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';
import 'package:reservation_app/src/features/admin/reservation/models/reservation_model.dart';
import 'package:reservation_app/src/features/customer/reservations/screens/previous_view.dart';
import 'package:reservation_app/src/features/customer/reservations/screens/upcoming_view.dart';

class ReservationProvider extends ChangeNotifier {
  final DioClient _dioClient = DioClient();

  List<ReservationModel> _reservations = [];

  List<ReservationModel> get reservations => _reservations;

  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  void changeTab(int index) {
    _selectedTab = index;
    notifyListeners();
  }

  List<StatefulWidget> buildTabViews() {
    return [
      const UpcomingView(),
      const PreviousView(),
    ];
  }

  Future<void> getAllReservations(BuildContext context) async {
    var userId = await SharedPrefs.getUserId();

    Response response = await _dioClient
        .init()
        .get('/reservations/user/$userId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    print("Here is the status code: ${response.statusCode}");

    if (response.statusCode == 200) {
      _reservations = (response.data as List)
          .map((reservation) => ReservationModel.fromJson(reservation))
          .toList();
    } else {
      _reservations = [];
    }
    notifyListeners();
  }
}
