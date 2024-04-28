import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/admin/scoreboard/models/scoreboard_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class ScoreboardDataSource extends DataGridSource {
  ScoreboardDataSource({required List<ScoreboardModel> scoreboards}) {
    _scoreboards = scoreboards
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<String>(columnName: 'userId', value: e.userId),
      DataGridCell<String>(columnName: 'score', value: e.score.toString()),
    ]))
        .toList();
  }

  List<DataGridRow> _scoreboards = [];

  @override
  List<DataGridRow> get rows => _scoreboards;

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