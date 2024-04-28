import 'package:reservation_app/src/features/customer/clubs/model/club_model.dart';

import '../../../admin/clubs/models/club_model.dart';

class TableModel {
  final String tableId;
  final String tableNumber;
  final int tableCapacity;
  final int reservedSeats;
  final String tableStatus;
  final String tableDescription;
  final ClubModel tableClub;


  TableModel({
    required this.tableId,
    required this.tableNumber,
    required this.tableCapacity,
    required this.reservedSeats,
    required this.tableStatus,
    required this.tableDescription,
    required this.tableClub,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      tableId: json['_id'],
      tableNumber: json['tableNumber'],
      tableCapacity: json['tableCapacity'],
      reservedSeats: json['reservedSeats'],
      tableStatus: json['tableStatus'],
      tableDescription: json['tableDescription'],
      tableClub: ClubModel.fromJson(json['tableClub']),
    );
  }
}
