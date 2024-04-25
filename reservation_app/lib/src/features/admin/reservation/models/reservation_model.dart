class ReservationModel {
  final String reservationId;
  final String userId;
  final String clubId;
  final String tableId;
  final String reserveSeats;
  final String reservationDate;
  final String reservationTime;
  final String reservationStatus;

  ReservationModel({
    required this.reservationId,
    required this.userId,
    required this.clubId,
    required this.tableId,
    required this.reserveSeats,
    required this.reservationDate,
    required this.reservationTime,
    required this.reservationStatus,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      reservationId: json['_id'],
      userId: json['userId'],
      clubId: json['clubId'],
      tableId: json['tableId'],
      reserveSeats: json['reserveSeats'].toString(),
      reservationDate: json['reservationDate'],
      reservationTime: json['reservationTime'],
      reservationStatus: json['status'],
    );
  }
}
