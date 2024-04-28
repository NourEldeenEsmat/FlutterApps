import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/super%20admin/admins/models/admin_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class AdminDataSource extends DataGridSource {
  AdminDataSource({required List<AdminModel> admins}) {
    _admins = admins
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'adminName', value: e.adminName),
              DataGridCell<String>(columnName: 'adminEmail', value: e.adminEmail),
            ]))
        .toList();
  }

  List<DataGridRow> _admins = [];

  @override
  List<DataGridRow> get rows => _admins;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        color: AppColors.whiteColor,
        cells: row.getCells().map<Widget>((dataGridCell) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8.0),
            child: Text(dataGridCell.value.toString()),
          );
        }).toList());
  }
}
