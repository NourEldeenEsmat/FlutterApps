import 'package:animated_custom_dropdown/custom_dropdown.dart';

class SearchTableModel with CustomDropdownListFilter {
  final String id;
  final String tableNumber;

  SearchTableModel({required this.tableNumber, required this.id});


  @override
  bool filter(String query) {
    return tableNumber.toLowerCase().contains(query.toLowerCase());
  }

  @override
  String toString() {
    return tableNumber;
  }

  factory SearchTableModel.fromJson(Map<String, dynamic> json) {
    return SearchTableModel(
      id: json['_id'],
      tableNumber: json['tableNumber'],
    );
  }
}
