import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/app_dialogs.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/admin/main/providers/admin_main_provider.dart';
import 'package:reservation_app/src/features/admin/tables/widgets/search_filter_widget.dart';
import 'package:reservation_app/src/features/super%20admin/admins/widgets/admin_input_widget.dart';
import 'package:reservation_app/src/features/super%20admin/main/providers/super_admin_main_provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

import '../providers/admin_provider.dart';

class ManageAdminScreen extends StatefulWidget {
  const ManageAdminScreen({Key? key}) : super(key: key);

  @override
  State<ManageAdminScreen> createState() => _ManageAdminScreenState();
}

class _ManageAdminScreenState extends State<ManageAdminScreen> {
  @override
  void initState() {
    Provider.of<AdminProvider>(context, listen: false).initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AdminProvider>(
        builder: (context, adminProvider, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: CustomAppBar(
                isBack: false,
                title: 'Manage Admins',
              ),
            ),
            body: Consumer<AdminProvider>(
              builder: (context, adminProvider, child) {
                return SfDataGridTheme(
                  data: SfDataGridThemeData(
                    headerColor: AppColors.whiteColor,
                  ),
                  child: Column(
                    children: [
                      const AdminTableSearchWidget(),
                      const SizedBox(height: 20),
                      Expanded(
                        child: adminProvider.admins.isNotEmpty
                            ? SfDataGrid(
                                allowPullToRefresh: true,
                                allowSwiping: true,
                                swipeMaxOffset: 80.0,
                                allowSorting: true,
                                startSwipeActionsBuilder: (BuildContext context,
                                    DataGridRow row, int rowIndex) {
                                  return GestureDetector(
                                    onTap: () async {
                                      var adminId = adminProvider
                                          .admins[rowIndex].adminId;
                                      await adminProvider.getAdminById(adminId);
                                      Provider.of<AdminMainProvider>(context,
                                              listen: false)
                                          .setBottomNavVisibility(false);
                                      showModalBottomSheet<dynamic>(
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (BuildContext bc) {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.6,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20),
                                              decoration: const BoxDecoration(
                                                  color: AppColors
                                                      .scaffoldBackgroundColor,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  25.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  25.0))),
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20),
                                                    child: Text(
                                                      'Admin Details',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Flexible(
                                                    child: AdminInputWidget(
                                                      labelText: 'Admin Name',
                                                      controller: adminProvider
                                                          .adminNameController,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Flexible(
                                                    child: AdminInputWidget(
                                                      labelText: 'Admin Email',
                                                      controller: adminProvider
                                                          .adminEmailController,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Flexible(
                                                    child: AdminInputWidget(
                                                      labelText:
                                                          'Admin Password',
                                                      controller: adminProvider
                                                          .adminPasswordController,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  Flexible(
                                                    child: AdminInputWidget(
                                                      labelText:
                                                          'Confirm Password',
                                                      controller: adminProvider
                                                          .adminConfirmPasswordController,
                                                    ),
                                                  ),

                                                  const SizedBox(height: 30),
                                                  //cancel and save
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      OutlinedButton(
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              AppColors
                                                                  .whiteColor,
                                                          foregroundColor:
                                                              AppColors
                                                                  .primaryColor,
                                                          minimumSize:
                                                              const Size(
                                                                  160, 60),
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            side:
                                                                const BorderSide(
                                                              color: AppColors
                                                                  .primaryColor,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
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
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                      const Spacer(),
                                                      ElevatedButton(
                                                        style: ElevatedButton
                                                            .styleFrom(
                                                          backgroundColor:
                                                              AppColors
                                                                  .primaryColor,
                                                          foregroundColor:
                                                              AppColors
                                                                  .whiteColor,
                                                          minimumSize:
                                                              const Size(
                                                                  160, 60),
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium,
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                        ),
                                                        onPressed: () async {
                                                          var adminId =
                                                              adminProvider
                                                                  .admins[
                                                                      rowIndex]
                                                                  .adminId;
                                                          Provider.of<AdminMainProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .setBottomNavVisibility(
                                                                  true);
                                                          Navigator.of(context)
                                                              .pop();
                                                          AppDialog
                                                              .showLoadingDialog(
                                                                  context,
                                                                  'Saving...');
                                                          await adminProvider
                                                              .updateAdmin(
                                                                  adminId);
                                                          GoRouter.of(context)
                                                              .pop();
                                                        },
                                                        child:
                                                            const Text('Save'),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
                                          }).then((value) {
                                        adminProvider.clearControllers();
                                        Provider.of<SuperAdminProvider>(context,
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
                                      print('Delete');
                                      var adminId = adminProvider
                                          .admins[rowIndex].adminId;
                                      AppDialog.showLoadingDialog(
                                          context, 'Deleting...');
                                      await adminProvider.deleteAdmin(adminId);
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
                                source: Provider.of<AdminProvider>(context)
                                    .adminDataSource,
                                columns: Provider.of<AdminProvider>(context)
                                    .getColumns(),
                              )
                            : const Center(
                                child: Text('No Admins'),
                              ),
                      ),
                    ],
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.primaryColor,
              foregroundColor: AppColors.textColor,
              onPressed: () {
                adminProvider.getAllAdmins();
                Provider.of<AdminMainProvider>(context, listen: false)
                    .setBottomNavVisibility(false);
                showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.6,
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
                                'Admin Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.w800),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: AdminInputWidget(
                                labelText: 'Admin Name',
                                controller: adminProvider.adminNameController,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: AdminInputWidget(
                                labelText: 'Admin Email',
                                controller: adminProvider.adminEmailController,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: AdminInputWidget(
                                labelText: 'Admin Password',
                                controller:
                                    adminProvider.adminPasswordController,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: AdminInputWidget(
                                labelText: 'Confirm Password',
                                controller: adminProvider
                                    .adminConfirmPasswordController,
                              ),
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
                                    Navigator.of(context).pop();
                                    AppDialog.showLoadingDialog(
                                        context, 'Saving...');
                                    await adminProvider.createAdmin(context);
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
                  Provider.of<SuperAdminProvider>(context, listen: false)
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
