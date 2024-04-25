import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/core/utils/shared_preferences.dart';
import 'package:reservation_app/src/features/admin/clubs/models/club_model.dart';
import 'package:reservation_app/src/features/admin/tables/data%20source/table_data_source.dart';
import 'package:reservation_app/src/features/admin/tables/models/search_club_model.dart';
import 'package:reservation_app/src/features/admin/tables/models/table_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ManageTablesProvider extends ChangeNotifier {
  List<TableModel> tables = <TableModel>[];
  late TableDataSource tableDataSource;
  List<SearchClubModel> searchClubs = <SearchClubModel>[];
  DioClient dioClient = DioClient();

  TextEditingController tableNumberController = TextEditingController();
  TextEditingController tableCapacityController = TextEditingController();
  TextEditingController tableStatusController = TextEditingController();
  TextEditingController clubIdController = TextEditingController();
  TextEditingController tableDescriptionController = TextEditingController();
  TextEditingController clubNameController = TextEditingController();
  ClubModel? selectedClub;

  void init() async {
    await getAdminAllTables();
    tableDataSource = TableDataSource(tables: tables);
    await getAllSearchClubs();
    print('Tables: $tables');
  }

  void updateDataGridSource() {
    tableDataSource = TableDataSource(tables: tables);
    notifyListeners();
  }

  //data grid columns
  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'tableNumber',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Table Number',
              overflow: TextOverflow.ellipsis,
            ),
          )),
      GridColumn(
          columnName: 'tableCapacity',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Capacity',
              overflow: TextOverflow.ellipsis,
            ),
          )),
      GridColumn(
          columnName: 'tableStatus',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Status',
              overflow: TextOverflow.ellipsis,
            ),
          )),
    ];
  }



  Future<void> deleteTable(String tableId) async {
    Response response = await dioClient
        .init()
        .delete('/tables/$tableId')
        .then((value) => value)
        .catchError((error) {
      print('Error: $error');
    });

    if (response.statusCode == 200) {
      print('Table deleted successfully');
      await getAdminAllTables();
      updateDataGridSource();
    } else {
      print('Error deleting table');
    }

    notifyListeners();
  }

  Future<void> updateTable(String tableId) async {
    //print table data
    print('Table Number: ${tableNumberController.text}');
    print('Table Capacity: ${tableCapacityController.text}');
    print('Table Status: ${tableStatusController.text}');
    print('Club Name: ${clubIdController.text}');

    Response response = await dioClient
        .init()
        .put('/tables/$tableId', data: {
          'tableNumber': tableNumberController.text,
          'tableCapacity': int.parse(tableCapacityController.text),
          'tableStatus': tableStatusController.text,
          'clubId': clubIdController.text
        })
        .then((value) => value)
        .catchError((error) {
          print('Error: $error');
        });

    if (response.statusCode == 200) {
      print('Table updated successfully');
      await getAdminAllTables();
      updateDataGridSource();
    } else {
      print('Error updating table');
    }

    notifyListeners();
  }

  Future<void> getTableById(String tableId) async {
    Response response = await dioClient
        .init()
        .get('/tables/$tableId')
        .then((value) => value)
        .catchError((error) {
      print('Error: $error');
    });

    if (response.statusCode == 200) {
      var table = TableModel.fromJson(response.data);
      tableNumberController.text = table.tableNumber;
      tableCapacityController.text = table.tableCapacity.toString();
      tableStatusController.text = table.tableStatus;
      clubIdController.text = table.clubId;

      //set club name
      setTableClub(table.clubId);
      //set table status
      setTableStatus(table.tableStatus);
      notifyListeners();
    } else {
      print('Error fetching data');
    }
  }

  Future<void> createTable() async {
    //print table data
    print('Table Number: ${tableNumberController.text}');
    print('Table Capacity: ${tableCapacityController.text}');
    print('Table Status: ${tableStatusController.text}');
    print('Club Name: ${clubIdController.text}');
    print('Table Description: ${tableDescriptionController.text}');
    Response response = await dioClient
        .init()
        .post('/tables', data: {
          'tableNumber': tableNumberController.text,
          'tableCapacity': int.parse(tableCapacityController.text),
          'tableStatus': tableStatusController.text,
          'tableDescription': tableDescriptionController.text,
          'tableClub': {
            'clubId': clubIdController.text,
          }
        })
        .then((value) => value)
        .catchError((error) {
          print('Error: $error');
        });

    if (response.statusCode == 200) {
      print('Table created successfully');
      await getAdminAllTables();
      updateDataGridSource();
    } else {
      print('Error creating table');
    }

    notifyListeners();
  }

  void setTableClub(String clubId) async {
    clubIdController.text = clubId;
    notifyListeners();
  }

  void setTableStatus(String status) {
    tableStatusController.text = status;
    notifyListeners();
  }

  Future<void> getAllSearchClubs() async {
    var adminId = await SharedPrefs.getUserId();

    Response response = await dioClient
        .init()
        .get('/clubs/admin/$adminId')
        .then((value) => value)
        .catchError((error) {
      print('Error: $error');
    });

    if (response.statusCode == 200) {
      searchClubs = (response.data as List)
          .map((e) => SearchClubModel.fromJson(e as Map<String, dynamic>))
          .toList();
      notifyListeners();
    } else {
      print('Error fetching data');
    }
  }

  Future<void> getAdminAllTables() async {
    //get admin all tables

    var adminId = await SharedPrefs.getUserId();

    Response response = await dioClient
        .init()
        .get('/tables/admin/$adminId')
        .then((value) => value)
        .catchError((error) {
      print('Error: $error');
    });

    if (response.statusCode == 200) {
      tables = (response.data as List)
          .map((e) => TableModel.fromJson(e as Map<String, dynamic>))
          .toList();
      tableDataSource = TableDataSource(tables: tables);
      //print tables
      tables.forEach((element) {
        print(element.tableNumber);
      });
      notifyListeners();
    } else {
      print('Error fetching data');
    }
  }
}
