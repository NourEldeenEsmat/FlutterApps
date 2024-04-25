import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/admin/clubs/models/club_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ClubDataSource extends DataGridSource {
  ClubDataSource({required List<ClubModel> clubs}) {
    _clubs = clubs
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'clubId', value: e.clubId),
              DataGridCell<String>(columnName: 'clubName', value: e.clubName),
              DataGridCell<String>(
                  columnName: 'clubLocation', value: e.clubLocation),
            ]))
        .toList();
  }

  List<DataGridRow> _clubs = [];

  @override
  List<DataGridRow> get rows => _clubs;

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
