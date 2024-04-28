import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';
import 'package:reservation_app/src/features/admin/reservation/models/reservation_model.dart';

class DashboardProvider extends ChangeNotifier {
  int _totalBookings = 0;
  int _availableTables = 0;
  double _totalRevenue = 0;
  List<ReservationModel> reservations = [];
  ReservationModel? recentReservation;
  late String recentTableNumber;

  final DioClient _dioClient = DioClient();

  int get totalBookings => _totalBookings;

  int get availableTables => _availableTables;

  double get totalRevenue => _totalRevenue;

  Future<void> init() async {
    await getDashboardData();
    await getReservations();
    await getRecentTableNumber(reservations.first.tableId);
    getFirstRecentReservation();
  }

  Future<void> getRecentTableNumber(String tableId) async {
    Response response =
        await _dioClient.init().get("/tables/$tableId").then((value) => value);

    if (response.statusCode == 200) {
      print("Recent Table Fetched");
      recentTableNumber = response.data['tableNumber'];
    }

    notifyListeners();
  }

  void getFirstRecentReservation() {
    recentReservation = reservations.first;
  }

  Future<void> getReservations() async {
    //get reservations
    Response response = await _dioClient
        .init()
        .get('/reservations')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Reservations fetched successfully");
      print(response.data);
      reservations = (response.data as List)
          .map((e) => ReservationModel.fromJson(e))
          .toList();
    } else {
      print("Error fetching reservations");
    }

    notifyListeners();
  }

  Future<void> getDashboardData() async {
    //get admin by id

    var adminId = await SharedPrefs.getUserId();
    Response response = await _dioClient
        .init()
        .get('/admins/$adminId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Admin fetched successfully");
      print(response.data);
      print("Available tables: ${response.data['availableTables']}");
      _totalBookings = int.parse(response.data['totalBookings'].toString());
      _availableTables = int.parse(response.data['availableTables'].toString());
      _totalRevenue = double.parse(response.data['totalRevenue'].toString());
    } else {
      print("Error fetching admin");
    }

    notifyListeners();
  }
}
