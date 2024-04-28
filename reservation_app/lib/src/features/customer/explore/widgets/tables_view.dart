import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../tables/providers/tables_provider.dart';
import '../../tables/widgets/available_tables.dart';

class TablesView extends StatefulWidget {
  const TablesView({super.key});

  @override
  State<TablesView> createState() => _TablesViewState();
}

class _TablesViewState extends State<TablesView> {
  @override
  void initState() {
    Provider.of<CustomerTablesProvider>(context, listen: false).initTables();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerTablesProvider>(
      builder: (context, tablesProvider, child) {
        return Padding(
          padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            itemCount: tablesProvider.tablesList.length,
            itemBuilder: (context, index) {
              return AvailableTablesWidget(
                clubName: tablesProvider.tablesList[index].tableClub.clubName,
                tableName: tablesProvider.tablesList[index].tableNumber,
                reservationDate: 'Feb 26th, 2024',
                reservationTime: '12:20 PM',
                reservedSeats: tablesProvider.tablesList[index].reservedSeats,
                totalSeats: tablesProvider.tablesList[index].tableCapacity,
                clubImage: 'assets/images/restaurant.jpg',
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 10);
            },
          ),
        );
      },
    );
  }
}
