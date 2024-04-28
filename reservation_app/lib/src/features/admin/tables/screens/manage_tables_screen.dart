import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/app_dialogs.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/admin/clubs/models/club_model.dart';
import 'package:reservation_app/src/features/admin/main/providers/admin_main_provider.dart';
import 'package:reservation_app/src/features/admin/tables/models/search_club_model.dart';
import 'package:reservation_app/src/features/admin/tables/providers/manage_tables_provider.dart';
import 'package:reservation_app/src/features/admin/tables/widgets/search_filter_widget.dart';
import 'package:reservation_app/src/features/admin/tables/widgets/table_input_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ManageTablesScreen extends StatefulWidget {
  const ManageTablesScreen({Key? key}) : super(key: key);

  @override
  State<ManageTablesScreen> createState() => _ManageTablesScreenState();
}

class _ManageTablesScreenState extends State<ManageTablesScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ManageTablesProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ManageTablesProvider>(
        builder: (context, manageTablesProvider, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: CustomAppBar(
                isBack: false,
                isTableScreen: true,
                title: 'Manage Tables',
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
                  manageTablesProvider.tables.isNotEmpty
                      ? Expanded(
                          child: SfDataGrid(
                            allowSwiping: true,
                            swipeMaxOffset: 80.0,
                            allowSorting: true,
                            startSwipeActionsBuilder: (BuildContext context,
                                DataGridRow row, int rowIndex) {
                              return GestureDetector(
                                onTap: () async {
                                  var tableId = manageTablesProvider
                                      .tables[rowIndex].tableId;
                                  await manageTablesProvider
                                      .getTableById(tableId);
                                  Provider.of<AdminMainProvider>(context,
                                          listen: false)
                                      .setBottomNavVisibility(false);
                                  showModalBottomSheet<dynamic>(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext bc) {
                                        return Container(
                                          height: MediaQuery.of(context).size.height * 0.7,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20),
                                          decoration: const BoxDecoration(
                                              color: AppColors
                                                  .scaffoldBackgroundColor,
                                              borderRadius: BorderRadius.only(
                                                  topLeft:
                                                      Radius.circular(25.0),
                                                  topRight:
                                                      Radius.circular(25.0))),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(20),
                                                child: Text(
                                                  'Table Details',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w800),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: TableInputWidget(
                                                      labelText: 'Table Number',
                                                      controller:
                                                          manageTablesProvider
                                                              .tableNumberController,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 20),
                                                  Flexible(
                                                    child: TableInputWidget(
                                                      labelText:
                                                          'Table Capacity',
                                                      controller:
                                                          manageTablesProvider
                                                              .tableCapacityController,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              CustomDropdown<
                                                  SearchClubModel>.search(
                                                decoration:
                                                    CustomDropdownDecoration(
                                                  closedBorderRadius:
                                                      BorderRadius.circular(12),
                                                  searchFieldDecoration:
                                                      SearchFieldDecoration(
                                                    hintStyle: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .copyWith(
                                                            color: AppColors
                                                                .textColor
                                                                .withOpacity(
                                                                    0.5)),
                                                    fillColor:
                                                        AppColors.whiteColor,
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12.0),
                                                      borderSide: BorderSide(
                                                        color: AppColors
                                                            .textColor
                                                            .withOpacity(0.12),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                hintText: 'Select Club Admin',
                                                initialItem:
                                                    manageTablesProvider
                                                        .searchClubs
                                                        .firstWhere((element) {
                                                  return element.id ==
                                                      manageTablesProvider
                                                          .clubIdController
                                                          .text;
                                                }),
                                                items: manageTablesProvider
                                                    .searchClubs,
                                                onChanged: (value) {
                                                  //set selected club NAME
                                                  manageTablesProvider
                                                      .setTableClub(value.id);
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                              //dropdown for table status
                                              CustomDropdown<String>(
                                                decoration:
                                                    CustomDropdownDecoration(
                                                  closedBorderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                hintText: 'Select Table Status',
                                                initialItem:
                                                    manageTablesProvider
                                                        .tableStatusController
                                                        .text,
                                                items: const [
                                                  'Available',
                                                  'Not Available',
                                                  'Partially Occupied',
                                                  'Fully Occupied'
                                                ],
                                                onChanged: (value) {
                                                  //set selected table status
                                                  manageTablesProvider
                                                      .setTableStatus(value);
                                                },
                                              ),
                                              const SizedBox(height: 10),
                                              TableInputWidget(
                                                labelText: 'Table Description',
                                                controller: manageTablesProvider
                                                    .tableDescriptionController,
                                              ),
                                              const SizedBox(height: 30),
                                              //cancel and save
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  OutlinedButton(
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          AppColors.whiteColor,
                                                      foregroundColor: AppColors
                                                          .primaryColor,
                                                      minimumSize:
                                                          const Size(160, 60),
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        side: const BorderSide(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    onPressed: () {
                                                      Provider.of<AdminMainProvider>(
                                                              context,
                                                              listen: false)
                                                          .setBottomNavVisibility(
                                                              true);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Cancel'),
                                                  ),
                                                  const Spacer(),
                                                  ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      backgroundColor: AppColors
                                                          .primaryColor,
                                                      foregroundColor:
                                                          AppColors.whiteColor,
                                                      minimumSize:
                                                          const Size(160, 60),
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelMedium,
                                                      shape:
                                                          RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                    ),
                                                    onPressed: () async {
                                                      Provider.of<AdminMainProvider>(
                                                              context,
                                                              listen: false)
                                                          .setBottomNavVisibility(
                                                              true);
                                                      AppDialog
                                                          .showLoadingDialog(
                                                              context,
                                                              'Updating...');
                                                      await manageTablesProvider
                                                          .updateTable(tableId);
                                                      Navigator.of(context)
                                                          .pop();
                                                      GoRouter.of(context)
                                                          .pop();
                                                    },
                                                    child: const Text('Save'),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      }).then((value) {
                                    Provider.of<AdminMainProvider>(context,
                                            listen: false)
                                        .setBottomNavVisibility(true);
                                  });
                                },
                                child: Container(
                                  color: Colors.greenAccent,
                                  child: const Center(
                                    child: Icon(Icons.edit),
                                  ),
                                ),
                              );
                            },
                            endSwipeActionsBuilder: (BuildContext context,
                                DataGridRow row, int rowIndex) {
                              return GestureDetector(
                                onTap: () async {
                                  var tableId = manageTablesProvider
                                      .tables[rowIndex].tableId;
                                  AppDialog.showLoadingDialog(
                                      context, 'Deleting...');
                                  await manageTablesProvider
                                      .deleteTable(tableId);
                                  GoRouter.of(context).pop();
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
                            horizontalScrollPhysics:
                                const BouncingScrollPhysics(),
                            source: manageTablesProvider.tableDataSource,
                            columns: manageTablesProvider.getColumns(),
                          ),
                        )
                      : const Expanded(
                          child: Center(child: Text('No tables found')),
                        ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.textColor,
              onPressed: () async {
                Provider.of<AdminMainProvider>(context, listen: false)
                    .setBottomNavVisibility(false);
                showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: const BoxDecoration(
                            color: AppColors.scaffoldBackgroundColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25.0),
                                topRight: Radius.circular(25.0))),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Text(
                                'Table Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.w800),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Flexible(
                                  child: TableInputWidget(
                                    labelText: 'Table Number',
                                    controller: manageTablesProvider
                                        .tableNumberController,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Flexible(
                                  child: TableInputWidget(
                                    labelText: 'Table Capacity',
                                    controller: manageTablesProvider
                                        .tableCapacityController,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            CustomDropdown<SearchClubModel>.search(
                              decoration: CustomDropdownDecoration(
                                closedBorderRadius: BorderRadius.circular(12),
                                searchFieldDecoration: SearchFieldDecoration(
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: AppColors.textColor
                                              .withOpacity(0.5)),
                                  fillColor: AppColors.whiteColor,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                    borderSide: BorderSide(
                                      color:
                                          AppColors.textColor.withOpacity(0.12),
                                    ),
                                  ),
                                ),
                              ),
                              hintText: 'Select Club Admin',
                              items: manageTablesProvider.searchClubs,
                              onChanged: (value) {
                                //set selected club NAME
                                manageTablesProvider.setTableClub(value.id);
                              },
                            ),
                            const SizedBox(height: 20),
                            //dropdown for table status
                            CustomDropdown<String>(
                              decoration: CustomDropdownDecoration(
                                closedBorderRadius: BorderRadius.circular(12),
                              ),
                              hintText: 'Select Table Status',
                              items: const [
                                'Available',
                                'Not Available',
                                'Partially Occupied',
                                'Fully Occupied'
                              ],
                              onChanged: (value) {
                                //set selected table status
                                manageTablesProvider.setTableStatus(value);
                              },
                            ),
                            const SizedBox(height: 10),
                            TableInputWidget(
                              labelText: 'Table Description',
                              controller: manageTablesProvider
                                  .tableDescriptionController,
                            ),
                            const SizedBox(height: 30),
                            //cancel and save
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: AppColors.whiteColor,
                                    foregroundColor: AppColors.primaryColor,
                                    minimumSize: const Size(160, 60),
                                    textStyle:
                                        Theme.of(context).textTheme.labelMedium,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        color: AppColors.primaryColor,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () {
                                    Provider.of<AdminMainProvider>(context,
                                            listen: false)
                                        .setBottomNavVisibility(true);
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('Cancel'),
                                ),
                                const Spacer(),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryColor,
                                    foregroundColor: AppColors.whiteColor,
                                    minimumSize: const Size(160, 60),
                                    textStyle:
                                        Theme.of(context).textTheme.labelMedium,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: () async {
                                    Provider.of<AdminMainProvider>(context,
                                            listen: false)
                                        .setBottomNavVisibility(true);
                                    AppDialog.showLoadingDialog(
                                        context, 'Adding...');
                                    await manageTablesProvider.createTable();
                                    Navigator.of(context).pop();
                                    GoRouter.of(context).pop();
                                  },
                                  child: const Text('Save'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }).then((value) {
                  Provider.of<AdminMainProvider>(context, listen: false)
                      .setBottomNavVisibility(true);
                });
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
