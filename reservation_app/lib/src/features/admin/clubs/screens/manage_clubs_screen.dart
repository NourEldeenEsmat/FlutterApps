import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/admin/clubs/providers/manage_clubs_provider.dart';
import 'package:reservation_app/src/features/admin/tables/widgets/search_filter_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ManageClubsScreen extends StatefulWidget {
  const ManageClubsScreen({Key? key}) : super(key: key);

  @override
  State<ManageClubsScreen> createState() => _ManageClubsScreenState();
}

class _ManageClubsScreenState extends State<ManageClubsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ClubProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            isBack: false,
            title: 'My Clubs',
          ),
        ),
        body: SfDataGridTheme(
          data: SfDataGridThemeData(
            headerColor: AppColors.whiteColor,
          ),
          child: Column(
            children: [
              const AdminTableSearchWidget(),
              const SizedBox(height: 20),
              Expanded(
                child: SfDataGrid(
                  allowSwiping: false,
                  swipeMaxOffset: 80.0,
                  allowSorting: true,
                  startSwipeActionsBuilder:
                      (BuildContext context, DataGridRow row, int rowIndex) {
                    return GestureDetector(
                      onTap: () {
                        print('Edit');
                      },
                      child: Container(
                        color: Colors.greenAccent,
                        child: const Center(
                          child: Icon(Icons.edit),
                        ),
                      ),
                    );
                  },
                  endSwipeActionsBuilder:
                      (BuildContext context, DataGridRow row, int rowIndex) {
                    return GestureDetector(
                      onTap: () {
                        Provider.of<ClubProvider>(context, listen: false)
                            .clubs
                            .removeAt(rowIndex);
                        Provider.of<ClubProvider>(context, listen: false)
                            .updateDataGridSource();
                      },
                      child: Container(
                        color: Colors.redAccent,
                        child: const Center(
                          child: Icon(Icons.delete),
                        ),
                      ),
                    );
                  },
                  navigationMode: GridNavigationMode.row,
                  columnWidthMode: ColumnWidthMode.fill,
                  rowsPerPage: 15,
                  horizontalScrollPhysics: const BouncingScrollPhysics(),
                  source: Provider.of<ClubProvider>(context).clubDataSource,
                  columns: Provider.of<ClubProvider>(context).getColumns(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
