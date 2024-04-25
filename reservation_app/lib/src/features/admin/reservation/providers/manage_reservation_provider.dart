import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';
import 'package:reservation_app/src/features/admin/reservation/models/reservation_model.dart';
import 'package:reservation_app/src/features/admin/reservation/models/search_club_model.dart';
import 'package:reservation_app/src/features/admin/reservation/models/search_table_model.dart';
import 'package:reservation_app/src/features/admin/reservation/models/search_user_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../data sources/reservation_data_source.dart';

class ManageReservationProvider extends ChangeNotifier {
  DioClient dioClient = DioClient();
  int seatsQty = 0;
  List<ReservationModel> reservations = <ReservationModel>[];
  List<SearchUserModel> searchUsers = <SearchUserModel>[];
  List<SearchTableModel> searchTables = <SearchTableModel>[];
  List<SearchClubModel> searchClubs = <SearchClubModel>[];
  ReservationDataSource reservationDataSource =
      ReservationDataSource(reservations: []);

  DateTime? reservationDate;
  DateTime? reservationTime;

  TextEditingController reservationIdController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController clubIdController = TextEditingController();
  TextEditingController tableIdController = TextEditingController();
  TextEditingController tableNumberController = TextEditingController();
  TextEditingController tableCapacityController = TextEditingController();
  TextEditingController reserveSeatsController = TextEditingController();
  TextEditingController reservationDateController = TextEditingController();
  TextEditingController reservationTimeController = TextEditingController();
  TextEditingController reservationStatusController = TextEditingController();

  void setReservationDate(DateTime date) {
    reservationDate = date;
    reservationDateController.text = date.toString().split(" ")[0];
    print("Date: ${reservationDateController.text}");
    notifyListeners();
  }

  void setReservationTime(DateTime time) {
    reservationTime = time;
    reservationTimeController.text = time.toString().split(" ")[1];
    //clean mms
    reservationTimeController.text =
        reservationTimeController.text.substring(0, 5);
    print("Time: ${reservationDateController.text}");
    notifyListeners();
  }

  void setSeatsQty(int seatsQty) {
    this.seatsQty = seatsQty;
    reserveSeatsController.text = seatsQty.toString();
    notifyListeners();
  }

  void init() async {
    await getReservations();
    await getSearchClubs();
    await getSearchUsers();
    reservationDataSource = ReservationDataSource(reservations: reservations);
  }

  void clearControllers() {
    reservationIdController.clear();
    userIdController.clear();
    clubIdController.clear();
    tableIdController.clear();
    reserveSeatsController.clear();
    reservationDateController.clear();
    reservationTimeController.clear();
    reservationStatusController.clear();
    seatsQty = 0;
    notifyListeners();
  }

  void updateDataGridSource() {
    reservationDataSource = ReservationDataSource(reservations: reservations);
    notifyListeners();
  }

  void setClubId(String clubId) {
    clubIdController.text = clubId;
    notifyListeners();
  }

  void setTableId(String tableId) {
    tableIdController.text = tableId;
    notifyListeners();
  }

  Future<void> getSearchUsers() async {
    //get users
    Response response = await dioClient
        .init()
        .get('/users')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Users fetched successfully");
      print(response.data);
      searchUsers = (response.data as List)
          .map((e) => SearchUserModel.fromJson(e))
          .toList();
    } else {
      print("Error fetching users");
    }
    notifyListeners();
  }

  //data grid columns
  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'ReservationId',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Reservation ID',
              overflow: TextOverflow.ellipsis,
            ),
          )),
      GridColumn(
          columnName: 'seatsQty',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Seats Quantity',
              overflow: TextOverflow.ellipsis,
            ),
          )),
    ];
  }

  void setUser(String userId) {
    userIdController.text = userId;
    notifyListeners();
  }

  Future<void> createReservation(BuildContext context) async {
    //create reservation
    //print all details
    print("Creating reservation with details:");
    print("userId: ${userIdController.text}");
    print("clubId: ${clubIdController.text}");
    print("tableId: ${tableIdController.text}");
    print("status: ${reservationStatusController.text}");
    print("reserveSeats: ${reserveSeatsController.text}");
    print("reservationDate: ${reservationDateController.text}");
    print("reservationTime: ${reservationTimeController.text}");

    Response response = await dioClient
        .init()
        .post('/reservations', data: {
          "userId": userIdController.text,
          "clubId": clubIdController.text,
          "tableId": tableIdController.text,
          "reserveSeats": reserveSeatsController.text,
          "reservationDate": reservationDateController.text,
          "reservationTime": reservationTimeController.text,
          "status": reservationStatusController.text
        })
        .then((value) => value)
        .catchError((error) {
          print(error);
        });

    if (response.statusCode == 200) {
      print("Reservation created successfully");
      print(response.data);
      getReservations();
    } else {
      print("Error creating reservation");
    }
    notifyListeners();
  }

  Future<void> getSearchClubs() async {
    //get clubs
    var adminId = await SharedPrefs.getUserId();
    Response response = await dioClient
        .init()
        .get('/clubs/admin/$adminId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Clubs fetched successfully");
      print(response.data);
      searchClubs = (response.data as List)
          .map((e) => SearchClubModel.fromJson(e))
          .toList();
    } else {
      print("Error fetching clubs");
    }
    notifyListeners();
  }

  Future<void> getReservationById(String reservationId) async {
    //get reservation by id
    Response response = await dioClient
        .init()
        .get('/reservations/$reservationId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Reservation fetched successfully");
      print(response.data);
      var reservation = ReservationModel.fromJson(response.data);
      reservationIdController.text = reservation.reservationId;
      userIdController.text = reservation.userId;
      clubIdController.text = reservation.clubId;
      tableIdController.text = reservation.tableId;
      reserveSeatsController.text = reservation.reserveSeats;
      seatsQty = int.parse(reservation.reserveSeats);
      reservationDateController.text = reservation.reservationDate;
      reservationTimeController.text = reservation.reservationTime;
      reservationStatusController.text = reservation.reservationStatus;
    } else {
      print("Error fetching reservation");
    }
    notifyListeners();
  }

  Future<void> updateReservation(String reservationId) async {
    print("Updating reservation with details:");
    print("userId: ${userIdController.text}");
    print("clubId: ${clubIdController.text}");
    print("tableId: ${tableIdController.text}");
    print("status: ${reservationStatusController.text}");
    print("reserveSeats: ${seatsQty}");
    print("reservationDate: ${reservationDateController.text}");
    print("reservationTime: ${reservationTimeController.text}");

    //update reservation
    Response response = await dioClient
        .init()
        .put('/reservations/$reservationId', data: {
          "userId": userIdController.text,
          "clubId": clubIdController.text,
          "tableId": tableIdController.text,
          "reserveSeats": seatsQty,
          "reservationDate": reservationDateController.text,
          "reservationTime": reservationTimeController.text,
          "status": reservationStatusController.text
        })
        .then((value) => value)
        .catchError((error) {
          print(error);
        });

    if (response.statusCode == 200) {
      print("Reservation updated successfully");
      print(response.data);
      getReservations();
    } else {
      print("Error updating reservation");
    }
    notifyListeners();
  }

  Future<void> deleteReservation(String reservationId) async {
    //delete reservation
    Response response = await dioClient
        .init()
        .delete('/reservations/$reservationId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Reservation deleted successfully");
      print(response.data);
      getReservations();
    } else {
      print("Error deleting reservation");
    }
    notifyListeners();
  }

  Future<void> getSearchTables(String clubId) async {
    //get tables

    print("Searching tables for clubId: $clubId");
    Response response = await dioClient
        .init()
        .get('/tables/club/$clubId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Tables fetched successfullyyy");
      print(response.data);
      searchTables = (response.data as List)
          .map((e) => SearchTableModel.fromJson(e))
          .toList();
    } else {
      print("Error fetching tables");
    }
    notifyListeners();
  }

  void setReservationStatus(String status) {
    reservationStatusController.text = status;
    notifyListeners();
  }

  Future<void> getReservations() async {
    //get reservations
    Response response = await dioClient
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
    updateDataGridSource();
    notifyListeners();
  }
}
