import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/app_dialogs.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/admin/scoreboard/providers/manage_scoreboard_provider.dart';
import 'package:reservation_app/src/features/admin/scoreboard/widgets/scoreboard_input_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../main/providers/admin_main_provider.dart';
import '../models/search_club_model.dart';
import '../models/search_user_model.dart';
import '../widgets/search_filter_widget.dart';

class ManageScoreboardScreen extends StatefulWidget {
  const ManageScoreboardScreen({super.key});

  @override
  State<ManageScoreboardScreen> createState() => _ManageScoreboardScreenState();
}

class _ManageScoreboardScreenState extends State<ManageScoreboardScreen> {
  @override
  void initState() {
    Provider.of<AdminManageScoreboardProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<AdminManageScoreboardProvider>(
        builder: (context, manageScoreboardProvider, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: CustomAppBar(
                isBack: false,
                title: 'Manage Scoreboard',
              ),
            ),
            body: SfDataGridTheme(
              data: SfDataGridThemeData(
                headerColor: AppColors.whiteColor,
              ),
              child: Column(
                children: [
                  const AdminScoreboardSearchWidget(),
                  const SizedBox(height: 20),
                  manageScoreboardProvider.scoreboards.isNotEmpty
                      ? Expanded(
                          child: SfDataGrid(
                            allowSwiping: true,
                            swipeMaxOffset: 80.0,
                            allowSorting: true,
                            startSwipeActionsBuilder: (BuildContext context,
                                DataGridRow row, int rowIndex) {
                              return GestureDetector(
                                onTap: () async {
                                  String scoreId = manageScoreboardProvider
                                      .scoreboards[rowIndex].scoreId;

                                  Provider.of<AdminMainProvider>(context,
                                          listen: false)
                                      .setBottomNavVisibility(false);
                                  await manageScoreboardProvider
                                      .getScoreById(scoreId);
                                  showModalBottomSheet<dynamic>(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext bc) {
                                        return Consumer<
                                            AdminManageScoreboardProvider>(
                                          builder: (context,
                                              adminScoreboardProvider, child) {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.55,
                                              width: double.infinity,
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
                                                      'Score Details',
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
                                                  ScoreboardInputWidget(
                                                    labelText: 'Score',
                                                    controller:
                                                        manageScoreboardProvider
                                                            .scoreController,
                                                  ),
                                                  const SizedBox(height: 20),
                                                  adminScoreboardProvider
                                                          .searchUsers
                                                          .isNotEmpty
                                                      ? CustomDropdown<
                                                          SearchUserModel>.search(
                                                          decoration:
                                                              CustomDropdownDecoration(
                                                            closedBorderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            searchFieldDecoration:
                                                                SearchFieldDecoration(
                                                              hintStyle: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .textColor
                                                                          .withOpacity(
                                                                              0.5)),
                                                              fillColor: AppColors
                                                                  .whiteColor,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: AppColors
                                                                      .textColor
                                                                      .withOpacity(
                                                                          0.12),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          hintText:
                                                              'Select User',
                                                          initialItem: adminScoreboardProvider
                                                              .searchUsers
                                                              .firstWhere((element) =>
                                                                  element.id ==
                                                                  adminScoreboardProvider
                                                                      .scoreboards[
                                                                          rowIndex]
                                                                      .userId),
                                                          items:
                                                              adminScoreboardProvider
                                                                  .searchUsers,
                                                          onChanged: (value) {
                                                            adminScoreboardProvider
                                                                .setUser(
                                                                    value.id);
                                                          },
                                                        )
                                                      : Container(
                                                          height: 50,
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              const CircularProgressIndicator(),
                                                        ),
                                                  const SizedBox(height: 20),
                                                  adminScoreboardProvider
                                                          .searchClubs
                                                          .isNotEmpty
                                                      ? CustomDropdown<
                                                          SearchClubModel>.search(
                                                          decoration:
                                                              CustomDropdownDecoration(
                                                            closedBorderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                            searchFieldDecoration:
                                                                SearchFieldDecoration(
                                                              hintStyle: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleSmall!
                                                                  .copyWith(
                                                                      color: AppColors
                                                                          .textColor
                                                                          .withOpacity(
                                                                              0.5)),
                                                              fillColor: AppColors
                                                                  .whiteColor,
                                                              border:
                                                                  OutlineInputBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            12.0),
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: AppColors
                                                                      .textColor
                                                                      .withOpacity(
                                                                          0.12),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          hintText:
                                                              'Select Club',
                                                          initialItem: adminScoreboardProvider
                                                              .searchClubs
                                                              .firstWhere((element) =>
                                                                  element.id ==
                                                                  adminScoreboardProvider
                                                                      .scoreboards[
                                                                          rowIndex]
                                                                      .clubId),
                                                          items:
                                                              adminScoreboardProvider
                                                                  .searchClubs,
                                                          onChanged:
                                                              (value) async {
                                                            adminScoreboardProvider
                                                                .setClubId(
                                                                    value.id);
                                                            print(value);
                                                          },
                                                        )
                                                      : Container(
                                                          height: 50,
                                                          alignment:
                                                              Alignment.center,
                                                          child:
                                                              const CircularProgressIndicator(),
                                                        ),
                                                  const SizedBox(height: 20),
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
                                                          String scoreId =
                                                              adminScoreboardProvider
                                                                  .scoreboards[
                                                                      rowIndex]
                                                                  .scoreId;
                                                          Provider.of<AdminMainProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .setBottomNavVisibility(
                                                                  true);
                                                          AppDialog
                                                              .showLoadingDialog(
                                                                  context,
                                                                  'Updating...');

                                                          await adminScoreboardProvider
                                                              .updateScore(
                                                                  scoreId);
                                                          GoRouter.of(context)
                                                              .pop();
                                                          Navigator.of(context)
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
                                          },
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
                                  var scoreId = manageScoreboardProvider
                                      .scoreboards[rowIndex].scoreId;
                                  AppDialog.showLoadingDialog(
                                      context, 'Deleting...');
                                  await manageScoreboardProvider
                                      .deleteScore(scoreId);
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
                            source:
                                manageScoreboardProvider.scoreboardDataSource,
                            columns: manageScoreboardProvider.getColumns(),
                          ),
                        )
                      : const Expanded(
                          child: Center(child: Text('No scores found')),
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
                      return Consumer<AdminManageScoreboardProvider>(
                        builder: (context, adminScoreboardProvider, child) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.55,
                            width: double.infinity,
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
                                    'Score Details',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                ScoreboardInputWidget(
                                  labelText: 'Score',
                                  controller:
                                      manageScoreboardProvider.scoreController,
                                ),
                                const SizedBox(height: 20),
                                adminScoreboardProvider.searchUsers.isNotEmpty
                                    ? CustomDropdown<SearchUserModel>.search(
                                        decoration: CustomDropdownDecoration(
                                          closedBorderRadius:
                                              BorderRadius.circular(12),
                                          searchFieldDecoration:
                                              SearchFieldDecoration(
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: AppColors.textColor
                                                        .withOpacity(0.5)),
                                            fillColor: AppColors.whiteColor,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: BorderSide(
                                                color: AppColors.textColor
                                                    .withOpacity(0.12),
                                              ),
                                            ),
                                          ),
                                        ),
                                        hintText: 'Select User',
                                        items:
                                            adminScoreboardProvider.searchUsers,
                                        onChanged: (value) {
                                          adminScoreboardProvider
                                              .setUser(value.id);
                                        },
                                      )
                                    : Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                const SizedBox(height: 20),
                                adminScoreboardProvider.searchClubs.isNotEmpty
                                    ? CustomDropdown<SearchClubModel>.search(
                                        decoration: CustomDropdownDecoration(
                                          closedBorderRadius:
                                              BorderRadius.circular(12),
                                          searchFieldDecoration:
                                              SearchFieldDecoration(
                                            hintStyle: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .copyWith(
                                                    color: AppColors.textColor
                                                        .withOpacity(0.5)),
                                            fillColor: AppColors.whiteColor,
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                              borderSide: BorderSide(
                                                color: AppColors.textColor
                                                    .withOpacity(0.12),
                                              ),
                                            ),
                                          ),
                                        ),
                                        hintText: 'Select Club',
                                        items:
                                            adminScoreboardProvider.searchClubs,
                                        onChanged: (value) async {
                                          adminScoreboardProvider
                                              .setClubId(value.id);
                                          print(value);
                                        },
                                      )
                                    : Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        child:
                                            const CircularProgressIndicator(),
                                      ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: AppColors.whiteColor,
                                        foregroundColor: AppColors.primaryColor,
                                        minimumSize: const Size(160, 60),
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                        shape: RoundedRectangleBorder(
                                          side: const BorderSide(
                                            color: AppColors.primaryColor,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onPressed: () async {
                                        Provider.of<AdminMainProvider>(context,
                                                listen: false)
                                            .setBottomNavVisibility(false);
                                        AppDialog.showLoadingDialog(
                                            context, 'Adding...');
                                        await adminScoreboardProvider
                                            .createScore();
                                        GoRouter.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
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
