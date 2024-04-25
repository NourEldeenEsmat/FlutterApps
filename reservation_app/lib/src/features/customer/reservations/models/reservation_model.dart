class ReservationModel {
  final String reservationId;
  final String userId;
  final String clubId;
  final String clubName;
  final String clubLocation;
  final String clubType;
  final String tableId;
  final int reservedSeats;
  final String reservationDate;
  final String reservationTime;
  final String reservationStatus;

  ReservationModel({
    required this.reservationId,
    required this.userId,
    required this.clubId,
    required this.clubName,
    required this.clubLocation,
    required this.clubType,
    required this.tableId,
    required this.reservedSeats,
    required this.reservationDate,
    required this.reservationTime,
    required this.reservationStatus,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      reservationId: json['reservationId'],
      userId: json['userId'],
      clubId: json['clubId'],
      clubName: json['clubName'],
      clubLocation: json['clubLocation'],
      clubType: json['clubType'],
      tableId: json['tableId'],
      reservedSeats: json['reservedSeats'],
      reservationDate: json['reservationDate'],
      reservationTime: json['reservationTime'],
      reservationStatus: json['reservationStatus'],
    );
  }
}
