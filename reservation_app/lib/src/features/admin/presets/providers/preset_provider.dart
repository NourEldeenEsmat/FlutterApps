import 'package:flutter/material.dart';
import 'package:reservation_app/src/features/admin/reservation/data%20sources/reservation_data_source.dart';
import 'package:reservation_app/src/features/admin/reservation/models/reservation_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

class PresetProvider extends ChangeNotifier {
  List<ReservationModel> reservations = <ReservationModel>[];
  late ReservationDataSource reservationDataSource;

  void init() {
    reservations = getReservations();
    reservationDataSource = ReservationDataSource(reservations: reservations);
  }

  void updateDataGridSource() {
    notifyListeners();
  }

  //data grid columns
  List<GridColumn> getColumns() {
    return <GridColumn>[
      GridColumn(
          columnName: 'ReservationId',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Preset ID',
              overflow: TextOverflow.ellipsis,
            ),
          )),
      GridColumn(
          columnName: 'seatsQty',
          label: Container(
            padding: const EdgeInsets.all(8.0),
            alignment: Alignment.center,
            child: const Text(
              'Preset Name',
              overflow: TextOverflow.ellipsis,
            ),
          )),
    ];
  }

  List<ReservationModel> getReservations() {
    return <ReservationModel>[
      ReservationModel(
          reservationId: '1',
          userId: '1',
          clubId: '1',
          tableId: '1',
          reserveSeats: "23",
          reservationDate: "23-1-2002",
          reservationTime: "23-1-2002",
          reservationStatus: 'Pending'),
    ];
  }
}
