import 'package:animated_custom_dropdown/custom_dropdown.dart';

class Admin with CustomDropdownListFilter {
  final String id;
  final String email;

  Admin({required this.email, required this.id});


  @override
  bool filter(String query) {
    return email.toLowerCase().contains(query.toLowerCase());
  }

  @override
  String toString() {
    return email;
  }

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      id: json['_id'],
      email: json['email'],
    );
  }
}
