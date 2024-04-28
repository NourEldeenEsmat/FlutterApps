import 'package:animated_custom_dropdown/custom_dropdown.dart';

class SearchUserModel with CustomDropdownListFilter {
  final String id;
  final String email;

  SearchUserModel({required this.email, required this.id});


  @override
  bool filter(String query) {
    return email.toLowerCase().contains(query.toLowerCase());
  }

  @override
  String toString() {
    return email;
  }

  factory SearchUserModel.fromJson(Map<String, dynamic> json) {
    return SearchUserModel(
      id: json['_id'],
      email: json['email'],
    );
  }
}
