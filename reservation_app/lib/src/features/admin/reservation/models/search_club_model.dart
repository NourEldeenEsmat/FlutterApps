import 'package:animated_custom_dropdown/custom_dropdown.dart';

class SearchClubModel with CustomDropdownListFilter {
  final String id;
  final String clubName;

  SearchClubModel({required this.clubName, required this.id});


  @override
  bool filter(String query) {
    return clubName.toLowerCase().contains(query.toLowerCase());
  }

  @override
  String toString() {
    return clubName;
  }

  factory SearchClubModel.fromJson(Map<String, dynamic> json) {
    return SearchClubModel(
      id: json['_id'],
      clubName: json['clubName'],
    );
  }
}
