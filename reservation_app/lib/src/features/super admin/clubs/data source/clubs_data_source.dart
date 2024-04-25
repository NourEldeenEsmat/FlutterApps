import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/super%20admin/clubs/models/club_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ManageClubDataSource extends DataGridSource {
  ManageClubDataSource({required List<ClubModel> clubs}) {
    _clubs = clubs
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'clubName', value: e.clubName),
              DataGridCell<String>(
                  columnName: 'clubLocation', value: e.clubLocation),
              DataGridCell(columnName: 'clubAdmin', value: e.clubAdmin),
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
