class ClubModel {
  final String clubId;
  final String clubName;
  final String clubLocation;
  final String clubType;
  final String clubPhoneNumber;
  final String clubStatus;
  final String clubAdminId;

  ClubModel({
    required this.clubId,
    required this.clubName,
    required this.clubLocation,
    required this.clubType,
    required this.clubPhoneNumber,
    required this.clubStatus,
    required this.clubAdminId,
  });

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
      clubId: json['_id'],
      clubName: json['clubName'],
      clubLocation: json['clubLocation'],
      clubType: json['clubType'],
      clubPhoneNumber: json['clubPhoneNumber'],
      clubStatus: json['clubStatus'],
      clubAdminId: json['clubAdmin'],
    );
  }
}
