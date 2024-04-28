import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/admin/tables/models/table_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class TableDataSource extends DataGridSource {
  TableDataSource({required List<TableModel> tables}) {
    _tables = tables
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(
                  columnName: 'tableNumber', value: e.tableNumber),
              DataGridCell<int>(
                  columnName: 'tableCapacity', value: e.tableCapacity),
              DataGridCell<String>(
                  columnName: 'tableStatus', value: e.tableStatus),
            ]))
        .toList();
  }

  List<DataGridRow> _tables = [];

  @override
  List<DataGridRow> get rows => _tables;

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
