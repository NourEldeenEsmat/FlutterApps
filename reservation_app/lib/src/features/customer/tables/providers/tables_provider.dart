import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/src/core/utils/dio_client.dart';
import 'package:reservation_app/src/features/customer/tables/models/table_model.dart';

class CustomerTablesProvider extends ChangeNotifier {
  DioClient dioClient = DioClient();
  List<TableModel> tablesList = [];

  TableModel? selectedTable;

  void setSelectedTable(TableModel table) {
    selectedTable = table;
    notifyListeners();
  }

  Future<void> initTables() async {
    print("Init tables");
    await getAllTables();
  }

  // Get all tables
  Future<void> getAllTables() async {
    try {
      Response response = await dioClient.init().get('/tables',options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },));

      if (response.statusCode == 200) {
        tablesList = (response.data as List)
            .map((tables) => TableModel.fromJson(tables))
            .toList();
        print("Tables: $tablesList");
      } else {
        print("Error getting tables");
      }
    } catch (e) {
      print("Error: $e");
    }
    notifyListeners();
  }
}
