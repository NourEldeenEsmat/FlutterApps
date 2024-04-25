import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/admin/tables/models/table_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../models/reservation_model.dart';

class ReservationDataSource extends DataGridSource {
  ReservationDataSource({required List<ReservationModel> reservations}) {
    _reservations = reservations
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'reservationId', value: e.reservationId),
              DataGridCell<String>(columnName: 'seatsQty', value: e.reserveSeats.toString()),
            ]))
        .toList();
  }

  List<DataGridRow> _reservations = [];

  @override
  List<DataGridRow> get rows => _reservations;

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
