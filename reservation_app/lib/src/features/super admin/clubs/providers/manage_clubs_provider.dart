import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/features/super%20admin/clubs/data%20source/clubs_data_source.dart';
import 'package:reservation_app/src/features/super%20admin/clubs/models/club_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:reservation_app/src/features/super%20admin/clubs/models/admin_search_model.dart';
class ManageClubProvider extends ChangeNotifier {
  final DioClient dioClient = DioClient();
  List<ClubModel> clubs = <ClubModel>[];
  List<Admin> searchAdmins = <Admin>[];
  late ManageClubDataSource manageClubDataSource;
  TextEditingController clubNameController = TextEditingController();
  TextEditingController clubLocationController = TextEditingController();
  TextEditingController clubEmailController = TextEditingController();
  TextEditingController clubPhoneNumberController = TextEditingController();
  TextEditingController clubTypeController = TextEditingController();
  TextEditingController clubAdminController = TextEditingController();
  bool isValidPhoneNumber = false;

  void init() {
    manageClubDataSource = ManageClubDataSource(clubs: clubs);
    getAllClubs();
  }

  void updateDataGridSource() {
    manageClubDataSource = ManageClubDataSource(clubs: clubs);
    notifyListeners();
  }

  void clearControllers() {
    clubNameController.clear();
    clubLocationController.clear();
    clubEmailController.clear();
    clubPhoneNumberController.clear();
    clubTypeController.clear();
    clubAdminController.clear();
  }

  void setPhoneNumber(PhoneNumber number) {
    //formatting the phone number and storing it in the controller for validation
    clubPhoneNumberController.text = number.phoneNumber!;
    print("Phone number: ${clubPhoneNumberController.text}");
  }

  void setClubAdmin(String adminId) {
    clubAdminController.text = adminId;
    print("Admin Id: ${clubAdminController.text}");
  }

  @override
  void dispose() {
    clubNameController.dispose();
    clubLocationController.dispose();
    clubEmailController.dispose();
    clubPhoneNumberController.dispose();
    clubTypeController.dispose();
    clubAdminController.dispose();
    super.dispose();
  }

  //data grid columns
  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'clubName',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Club Name',
              overflow: TextOverflow.ellipsis,
            ),
          )),
      GridColumn(
          columnName: 'clubLocation',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Club Location',
              overflow: TextOverflow.ellipsis,
            ),
          )),
      GridColumn(
          columnName: 'clubAdmin',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Club Admin',
              overflow: TextOverflow.ellipsis,
            ),
          )),
    ];
  }

  Future<void> getAllSearchAdmin() async {
    Response response = await dioClient
        .init()
        .get('/admins')
        .then((value) => value)
        .catchError((error) {
      print('Error: $error');
    });
    if (response.statusCode == 200) {
      searchAdmins = (response.data as List)
          .map((e) => Admin.fromJson(e as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } else {
      print('Error fetching data');
    }
  }

  Future<void> getAllClubs() async {
    Response response = await dioClient
        .init()
        .get('/clubs')
        .then((value) => value)
        .catchError((error) {
      print('Error: $error');
    });
    if (response.statusCode == 200) {
      clubs = (response.data as List)
          .map((e) => ClubModel.fromJson(e as Map<String, dynamic>))
          .toList();
      updateDataGridSource();
    } else {
      print('Error fetching data');
    }
    notifyListeners();
  }

  Future<void> createClub(BuildContext context) async {
    String clubName = clubNameController.text;
    String clubLocation = clubLocationController.text;
    String clubPhoneNumber = clubPhoneNumberController.text;
    String clubType = clubTypeController.text;
    String clubAdmin = clubAdminController.text;

    print('Club Name: $clubName');
    print('Club Location: $clubLocation');
    print('Club Phone Number: $clubPhoneNumber');
    print('Club Type: $clubType');
    print('Club Admin: $clubAdmin');

    Response response = await dioClient
        .init()
        .post('/clubs', data: {
          'clubName': clubName,
          'clubLocation': clubLocation,
          'clubType': clubType,
          'clubAdmin': clubAdmin,
          'clubPhoneNumber': clubPhoneNumber,
        })
        .then((value) => value)
        .catchError((error) {
          print('Error: $error');
        });

    if (response.statusCode == 200) {
      getAllClubs();
      clearControllers();
      updateDataGridSource();
      print('Club created successfully');
    } else {
      print('Error creating club');
    }
  }

  Future<void> deleteClub(String clubId) async {
    Response response = await dioClient
        .init()
        .delete('/clubs/$clubId')
        .then((value) => value)
        .catchError((error) {
      print('Error: $error');
    });
    if (response.statusCode == 200) {
      getAllClubs();
      print('Club deleted successfully');
    } else {
      print('Error deleting club');
    }
  }

  Future<void> getClubById(String clubId) async {
    Response response = await dioClient
        .init()
        .get('/clubs/$clubId')
        .then((value) => value)
        .catchError((error) {
      print('Error: $error');
    });
    if (response.statusCode == 200) {
      ClubModel club = ClubModel.fromJson(response.data);
      clubNameController.text = club.clubName;
      clubLocationController.text = club.clubLocation;
      clubPhoneNumberController.text = club.clubPhoneNumber;
      clubTypeController.text = club.clubType;
      clubAdminController.text = club.clubAdmin;
      notifyListeners();
    } else {
      print('Error fetching data');
    }
  }

  Future<void> updateClub(String clubId) async {
    String clubName = clubNameController.text;
    String clubLocation = clubLocationController.text;
    String clubPhoneNumber = clubPhoneNumberController.text;
    String clubType = clubTypeController.text;
    String clubAdmin = clubAdminController.text;

    Response response = await dioClient
        .init()
        .put('/clubs/$clubId', data: {
          'clubName': clubName,
          'clubLocation': clubLocation,
          'clubPhoneNumber': clubPhoneNumber,
          'clubType': clubType,
          'clubAdmin': clubAdmin,
        })
        .then((value) => value)
        .catchError((error) {
          print('Error: $error');
        });

    if (response.statusCode == 200) {
      getAllClubs();
      clearControllers();
      updateDataGridSource();
      print('Club updated successfully');
    } else {
      print('Error updating club');
    }
  }
}
