class TableModel {
  final String tableId;
  final String tableNumber;
  final int tableCapacity;
  final String tableStatus;
  final String clubId;


  TableModel({
    required this.tableId,
    required this.tableNumber,
    required this.tableCapacity,
    required this.tableStatus,
    required this.clubId,
  });

  factory TableModel.fromJson(Map<String, dynamic> json) {
    return TableModel(
      tableId: json['_id'],
      tableNumber: json['tableNumber'],
      tableCapacity: json['tableCapacity'],
      tableStatus: json['tableStatus'],
      clubId: json['clubId'],
    );
  }
}
