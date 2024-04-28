class AdminModel {
  final String adminId;
  final String adminName;
  final String adminEmail;
  final String adminPassword;
  final String? adminNationality;
  final String? adminPhone;
  final String? adminGender;

  AdminModel({
    required this.adminId,
    required this.adminName,
    required this.adminEmail,
    required this.adminPassword,
    this.adminNationality,
    this.adminPhone,
    this.adminGender,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      adminId: json['_id'],
      adminName: json['fullName'],
      adminEmail: json['email'],
      adminPassword: json['password'],
      adminNationality: json['nationality'],
      adminPhone: json['phoneNumber'],
      adminGender: json['gender'],
    );
  }
}
