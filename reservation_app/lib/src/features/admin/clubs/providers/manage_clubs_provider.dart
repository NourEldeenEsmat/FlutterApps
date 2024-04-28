import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';
import 'package:reservation_app/src/features/admin/clubs/data%20source/clubs_data_source.dart';
import 'package:reservation_app/src/features/admin/clubs/models/club_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ClubProvider extends ChangeNotifier {
  final DioClient _dioClient = DioClient();
  List<ClubModel> clubs = <ClubModel>[];
  late ClubDataSource clubDataSource;

  void init() {
    getAllAdminClubs();
    clubDataSource = ClubDataSource(clubs: clubs);
    print("Data source initialized");
    //print all clubs
    print(clubs);
  }

  void updateDataGridSource() {
    clubDataSource = ClubDataSource(clubs: clubs);
    notifyListeners();
  }

  //data grid columns
  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'clubId',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Club ID',
              overflow: TextOverflow.ellipsis,
            ),
          )),
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
    ];
  }

  Future<void> getAllAdminClubs() async {
    var adminId = await SharedPrefs.getUserId();
    print("Admin ID: $adminId");
    //get all clubs
    Response response = await _dioClient
        .init()
        .get('/clubs/admin/$adminId',options: Options(
      followRedirects: false,
      validateStatus: (status) {
        return status! < 500;
      },))
        .then((value) => value)
        .catchError((error) {
      print(error);
    });
    if (response.statusCode == 200) {
      print("Clubs fetched successfully");
      print(response.data);
      clubs =
          (response.data as List).map((e) => ClubModel.fromJson(e)).toList();
      updateDataGridSource();
    } else {
      print("Error fetching clubs");
    }
  }
}
