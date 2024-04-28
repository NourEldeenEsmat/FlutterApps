import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/tables/providers/tables_provider.dart';
import 'package:reservation_app/src/features/customer/tables/widgets/available_tables.dart';
import 'package:reservation_app/src/features/customer/tables/widgets/search_filter_widget.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {

  @override
  void initState() {
    Provider.of<CustomerTablesProvider>(context, listen: false).initTables();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerTablesProvider>(
      builder: (context, tablesProvider, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: CustomAppBar(
              title: 'Available Tables',
              isBack: true,
              isHome: false,
            ),
          ),
          body: Column(
            children: [
              const SearchFilterWidget(),
              const SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child:  Consumer<CustomerTablesProvider>(
                    builder: (context, CustomerTablesProvider bloc,child) =>
                        ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: const BouncingScrollPhysics(),
                          itemCount: bloc.tablesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return AvailableTablesWidget(
                              clubName: bloc.tablesList[index].tableClub.clubName,
                              tableName: bloc.tablesList[index].tableNumber,
                              reservationDate: bloc.tablesList[index].tableDescription,
                              reservationTime: bloc.tablesList[index].tableDescription,
                              reservedSeats: bloc.tablesList[index].reservedSeats,
                              totalSeats: bloc.tablesList[index].tableCapacity,
                              clubImage: 'assets/images/restaurant.jpg',
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10);
                          },
                        )
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
