import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/features/super%20admin/admins/data%20sources/admin_data_source.dart';
import 'package:reservation_app/src/features/super%20admin/admins/models/admin_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AdminProvider extends ChangeNotifier {
  final DioClient dioClient = DioClient();
  List<AdminModel> admins = <AdminModel>[];
  late AdminDataSource adminDataSource;
  TextEditingController adminNameController = TextEditingController();
  TextEditingController adminEmailController = TextEditingController();
  TextEditingController adminPasswordController = TextEditingController();
  TextEditingController adminConfirmPasswordController =
      TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController nationalityController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  bool isValidPhoneNumber = false;

  void initialize() {
    adminDataSource = AdminDataSource(admins: admins);
    getAllAdmins();
  }

  void updateDataGridSource() {
    notifyListeners();
  }

  void clearControllers() {
    adminNameController.clear();
    adminEmailController.clear();
    adminPasswordController.clear();
    adminConfirmPasswordController.clear();
  }

  //data grid columns
  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'adminName',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Admin Name',
              overflow: TextOverflow.ellipsis,
            ),
          )),
      GridColumn(
          columnName: 'adminEmail',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Admin Email',
              overflow: TextOverflow.ellipsis,
            ),
          )),
    ];
  }

  Future<void> getAllAdmins() async {
    Response response = await dioClient
        .init()
        .get('/admins')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      admins =
          (response.data as List).map((e) => AdminModel.fromJson(e)).toList();
      adminDataSource = AdminDataSource(admins: admins);
      print("Admins: $admins");
    } else {
      print("Error fetching data");
    }
    notifyListeners();
  }

  Future<void> createAdmin(BuildContext context) async {
    String adminName = adminNameController.text;
    String adminEmail = adminEmailController.text;
    String adminPassword = adminPasswordController.text;
    String adminConfirmPassword = adminConfirmPasswordController.text;

    Response response = await dioClient
        .init()
        .post('/register', data: {
          'fullName': adminName,
          'email': adminEmail,
          'password': adminPassword,
          'confirmPassword': adminConfirmPassword,
          "role": "admin"
        })
        .then((value) => value)
        .catchError((error) {
          print(error);
        });

    if (response.statusCode == 201) {
      print("Admin created successfully");
      clearControllers();
      getAllAdmins();
    } else {
      print("Error creating admin");
    }
  }

  Future<void> deleteAdmin(String adminId) async {
    Response response = await dioClient
        .init()
        .delete('/admins/$adminId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Admin deleted successfully");
      await getAllAdmins();
    } else {
      print("Error deleting admin");
    }
  }

  Future<void> updateAdmin(String adminId) async {
    String adminName = adminNameController.text;
    String adminEmail = adminEmailController.text;
    String adminPassword = adminPasswordController.text;
    String adminConfirmPassword = adminConfirmPasswordController.text;

    Response response = await dioClient
        .init()
        .put('/admins/$adminId', data: {
          'fullName': adminName,
          'email': adminEmail,
          'password': adminPassword,
          'confirmPassword': adminConfirmPassword,
        })
        .then((value) => value)
        .catchError((error) {
          print(error);
        });

    if (response.statusCode == 200) {
      print("Admin updated successfully");
      clearControllers();
      getAllAdmins();
    } else {
      print("Error updating admin");
    }
  }

  Future<void> getAdminById(String adminId) async {
    Response response = await dioClient
        .init()
        .get('/admins/$adminId')
        .then((value) => value)
        .catchError((error) {
      print(error);
    });

    if (response.statusCode == 200) {
      print("Admin fetched successfully");
      adminNameController.text = response.data['fullName'];
      adminEmailController.text = response.data['email'];
      adminPasswordController.text = response.data['password'];
      adminConfirmPasswordController.text = response.data['password'];
    } else {
      print("Error fetching admin");
    }
  }

  @override
  void dispose() {
    adminNameController
      ..dispose()
      ..clear();
    adminEmailController
      ..dispose()
      ..clear();
    adminPasswordController
      ..dispose()
      ..clear();
    adminConfirmPasswordController
      ..dispose()
      ..clear();
    dobController
      ..dispose()
      ..clear();
    genderController
      ..dispose()
      ..clear();
  }
}
