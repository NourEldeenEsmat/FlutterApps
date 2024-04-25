class ClubModel {
  final String clubId;
  final String clubName;
  final String? clubAdmin;
  final String clubLocation;
  final String? clubType;
  final String? clubPhoneNumber;


  ClubModel({
    required this.clubId,
    required this.clubName,
    required this.clubAdmin,
    required this.clubLocation,
    required this.clubType,
    required this.clubPhoneNumber,
  });

  factory ClubModel.fromJson(Map<String, dynamic> json) {
    return ClubModel(
      clubId: json['clubId'],
      clubName: json['clubName'],
      clubAdmin: json['clubAdmin'],
      clubLocation: json['clubLocation'],
      clubType: json['clubType'],
      clubPhoneNumber: json['clubPhoneNumber'],
    );
  }
}
