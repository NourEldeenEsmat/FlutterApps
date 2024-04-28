import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:cart_stepper/cart_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/app_dialogs.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/admin/reservation/models/search_table_model.dart';
import 'package:reservation_app/src/features/admin/reservation/models/search_user_model.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import '../../main/providers/admin_main_provider.dart';
import '../../tables/widgets/search_filter_widget.dart';
import '../../tables/widgets/table_input_widget.dart';
import '../models/search_club_model.dart';
import '../providers/manage_reservation_provider.dart';

class ManageReservationsScreen extends StatefulWidget {
  const ManageReservationsScreen({Key? key}) : super(key: key);

  @override
  State<ManageReservationsScreen> createState() =>
      _ManageReservationsScreenState();
}

class _ManageReservationsScreenState extends State<ManageReservationsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ManageReservationProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ManageReservationProvider>(
        builder: (context, manageReservationProvider, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: CustomAppBar(
                isBack: false,
                title: 'Manage Reservations',
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
                  manageReservationProvider.reservations.isNotEmpty
                      ? Expanded(
                          child: SfDataGrid(
                            allowSwiping: true,
                            swipeMaxOffset: 80.0,
                            allowSorting: true,
                            startSwipeActionsBuilder: (BuildContext context,
                                DataGridRow row, int rowIndex) {
                              return GestureDetector(
                                onTap: () async {
                                  String reservationId =
                                      manageReservationProvider
                                          .reservations[rowIndex].reservationId;
                                  Provider.of<AdminMainProvider>(context,
                                          listen: false)
                                      .setBottomNavVisibility(false);
                                  await manageReservationProvider
                                      .getReservationById(reservationId);
                                  showModalBottomSheet<dynamic>(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext bc) {
                                        return Consumer<
                                            ManageReservationProvider>(
                                          builder: (context, provider, child) {
                                            return Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.9,
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
                                                      'Reservation Details',
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
                                                  manageReservationProvider
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
                                                          initialItem: manageReservationProvider
                                                              .searchUsers
                                                              .firstWhere((element) =>
                                                                  element.id ==
                                                                  manageReservationProvider
                                                                      .reservations[
                                                                          rowIndex]
                                                                      .userId),
                                                          items:
                                                              manageReservationProvider
                                                                  .searchUsers,
                                                          onChanged: (value) {
                                                            manageReservationProvider
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
                                                  manageReservationProvider
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
                                                          initialItem: manageReservationProvider
                                                              .searchClubs
                                                              .firstWhere((element) =>
                                                                  element.id ==
                                                                  manageReservationProvider
                                                                      .reservations[
                                                                          rowIndex]
                                                                      .clubId),
                                                          items: provider
                                                              .searchClubs,
                                                          onChanged:
                                                              (value) async {
                                                            provider.setClubId(
                                                                value.id);
                                                            await provider
                                                                .getSearchTables(
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
                                                  provider.searchTables
                                                          .isNotEmpty
                                                      ? CustomDropdown<
                                                          SearchTableModel>.search(
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
                                                              'Select Table',
                                                          initialItem: manageReservationProvider
                                                              .searchTables
                                                              .firstWhere((element) =>
                                                                  element.id ==
                                                                  manageReservationProvider
                                                                      .reservations[
                                                                          rowIndex]
                                                                      .tableId),
                                                          items:
                                                              manageReservationProvider
                                                                  .searchTables,
                                                          onChanged: (value) {
                                                            manageReservationProvider
                                                                .setTableId(
                                                                    value.id);
                                                            print(value);
                                                          },
                                                        )
                                                      : Container(
                                                          height: 60,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: AppColors
                                                                .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12)),
                                                          ),
                                                          child: Text(
                                                            'Select Club to get tables',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    color: AppColors
                                                                        .redBgColor
                                                                        .withOpacity(
                                                                            0.7)),
                                                          ),
                                                        ),
                                                  const SizedBox(height: 20),
                                                  //dropdown for table status
                                                  provider.tableIdController
                                                          .text.isNotEmpty
                                                      ? CustomDropdown<String>(
                                                          decoration:
                                                              CustomDropdownDecoration(
                                                            closedBorderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        12),
                                                          ),
                                                          hintText:
                                                              'Select Table Status',
                                                          initialItem:
                                                              manageReservationProvider
                                                                  .reservations[
                                                                      rowIndex]
                                                                  .reservationStatus,
                                                          items: const [
                                                            'Reserved',
                                                            'Pending',
                                                            'Completed',
                                                            'Cancelled'
                                                          ],
                                                          onChanged: (value) {
                                                            //set selected table status
                                                            provider
                                                                .setReservationStatus(
                                                                    value);
                                                          },
                                                        )
                                                      : Container(
                                                          height: 60,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          padding:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  horizontal:
                                                                      20),
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: AppColors
                                                                .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            12)),
                                                          ),
                                                          child: Text(
                                                            'Select Table First',
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .bodySmall!
                                                                .copyWith(
                                                                    fontSize:
                                                                        16,
                                                                    color: AppColors
                                                                        .redBgColor
                                                                        .withOpacity(
                                                                            0.7)),
                                                          ),
                                                        ),
                                                  const SizedBox(height: 20),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          'Seats Quantity',
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleSmall!
                                                              .copyWith(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w800),
                                                        ),
                                                      ),
                                                      const Spacer(),
                                                      CartStepper(
                                                        size: 40,
                                                        style: CartStepperStyle(
                                                          buttonAspectRatio: 1,
                                                          radius: const Radius
                                                              .circular(10),
                                                          activeBackgroundColor:
                                                              AppColors
                                                                  .primaryColor,
                                                          activeForegroundColor:
                                                              AppColors
                                                                  .whiteColor,
                                                          elevation: 0,
                                                          textStyle:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .labelMedium!
                                                                  .copyWith(
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                        ),
                                                        value:
                                                            manageReservationProvider
                                                                .seatsQty,
                                                        didChangeCount:
                                                            (int value) {
                                                          //setter
                                                          manageReservationProvider
                                                              .setSeatsQty(
                                                                  value);
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                  const SizedBox(height: 20),
                                                  TextFormField(
                                                    onTap: () async {
                                                      await showCupertinoModalPopup<
                                                          void>(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: AppColors
                                                                  .whiteColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12),
                                                              ),
                                                            ),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.3,
                                                            child:
                                                                CupertinoDatePicker(
                                                              mode:
                                                                  CupertinoDatePickerMode
                                                                      .date,
                                                              onDateTimeChanged:
                                                                  (value) {
                                                                manageReservationProvider
                                                                    .setReservationDate(
                                                                        value);
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    controller:
                                                        manageReservationProvider
                                                            .reservationDateController,
                                                    readOnly: true,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please select reservation date';
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                      hintText: 'Select Date',
                                                      suffixIcon: const Icon(
                                                          FontAwesomeIcons
                                                              .calendarDay,
                                                          color: AppColors
                                                              .primaryColor),
                                                      hintStyle: Theme.of(
                                                              context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .textColor
                                                                  .withOpacity(
                                                                      0.5)),
                                                      fillColor:
                                                          AppColors.whiteColor,
                                                      filled: true,
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        borderSide: BorderSide(
                                                          color: AppColors
                                                              .textColor
                                                              .withOpacity(
                                                                  0.12),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(height: 20),
                                                  TextFormField(
                                                    onTap: () async {
                                                      await showCupertinoModalPopup<
                                                          void>(
                                                        context: context,
                                                        builder: (BuildContext
                                                            context) {
                                                          return Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                              color: AppColors
                                                                  .whiteColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        12),
                                                                topRight: Radius
                                                                    .circular(
                                                                        12),
                                                              ),
                                                            ),
                                                            height: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .height *
                                                                0.3,
                                                            child:
                                                                CupertinoDatePicker(
                                                              mode:
                                                                  CupertinoDatePickerMode
                                                                      .time,
                                                              onDateTimeChanged:
                                                                  (value) {
                                                                manageReservationProvider
                                                                    .setReservationTime(
                                                                        value);
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                    controller:
                                                        manageReservationProvider
                                                            .reservationTimeController,
                                                    readOnly: true,
                                                    validator: (value) {
                                                      if (value == null ||
                                                          value.isEmpty) {
                                                        return 'Please select reservation time';
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                    decoration: InputDecoration(
                                                      hintText: 'Select Time',
                                                      suffixIcon: const Icon(
                                                          FontAwesomeIcons
                                                              .clock,
                                                          color: AppColors
                                                              .primaryColor),
                                                      hintStyle: Theme.of(
                                                              context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .textColor
                                                                  .withOpacity(
                                                                      0.5)),
                                                      fillColor:
                                                          AppColors.whiteColor,
                                                      filled: true,
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        borderSide:
                                                            const BorderSide(
                                                          color: AppColors
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                      border:
                                                          OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12.0),
                                                        borderSide: BorderSide(
                                                          color: AppColors
                                                              .textColor
                                                              .withOpacity(
                                                                  0.12),
                                                        ),
                                                      ),
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
                                                          String reservationId =
                                                              manageReservationProvider
                                                                  .reservations[
                                                                      rowIndex]
                                                                  .reservationId;
                                                          Provider.of<AdminMainProvider>(
                                                                  context,
                                                                  listen: false)
                                                              .setBottomNavVisibility(
                                                                  true);
                                                          AppDialog
                                                              .showLoadingDialog(
                                                                  context,
                                                                  'Updating...');

                                                          await manageReservationProvider
                                                              .updateReservation(
                                                                  reservationId);
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
                                    manageReservationProvider
                                        .clearControllers();
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
                                  String reservationId =
                                      manageReservationProvider
                                          .reservations[rowIndex].reservationId;
                                  AppDialog.showLoadingDialog(
                                      context, 'Deleting...');
                                  await manageReservationProvider
                                      .deleteReservation(reservationId);
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
                                manageReservationProvider.reservationDataSource,
                            columns:
                                Provider.of<ManageReservationProvider>(context)
                                    .getColumns(),
                          ),
                        )
                      : const Expanded(
                          child: Center(
                            child: Text('No reservations found'),
                          ),
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
                await manageReservationProvider.getSearchClubs();
                showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext bc) {
                      return Consumer<ManageReservationProvider>(
                        builder: (context, provider, child) {
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.9,
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
                                    'Reservation Details',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(fontWeight: FontWeight.w800),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                manageReservationProvider.searchUsers.isNotEmpty
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
                                        items: manageReservationProvider
                                            .searchUsers,
                                        onChanged: (value) {
                                          manageReservationProvider
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
                                manageReservationProvider.searchClubs.isNotEmpty
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
                                        items: provider.searchClubs,
                                        onChanged: (value) async {
                                          provider.setClubId(value.id);
                                          await provider
                                              .getSearchTables(value.id);
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
                                provider.clubIdController.text.isNotEmpty &&
                                        provider.searchTables.isNotEmpty
                                    ? CustomDropdown<SearchTableModel>.search(
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
                                        hintText: 'Select Table',
                                        items: manageReservationProvider
                                            .searchTables,
                                        onChanged: (value) {
                                          manageReservationProvider
                                              .setTableId(value.id);
                                          print(value);
                                        },
                                      )
                                    : Container(
                                        height: 60,
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: const BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: Text(
                                          'Select Club to get tables',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: AppColors.redBgColor
                                                      .withOpacity(0.7)),
                                        ),
                                      ),
                                const SizedBox(height: 20),
                                //dropdown for table status
                                provider.tableIdController.text.isNotEmpty
                                    ? CustomDropdown<String>(
                                        decoration: CustomDropdownDecoration(
                                          closedBorderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        hintText: 'Select Table Status',
                                        items: const [
                                          'Reserved',
                                          'Pending',
                                          'Completed',
                                          'Cancelled'
                                        ],
                                        onChanged: (value) {
                                          //set selected table status
                                          provider.setReservationStatus(value);
                                        },
                                      )
                                    : Container(
                                        height: 60,
                                        alignment: Alignment.centerLeft,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        decoration: const BoxDecoration(
                                          color: AppColors.whiteColor,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(12)),
                                        ),
                                        child: Text(
                                          'Select Table First',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  fontSize: 16,
                                                  color: AppColors.redBgColor
                                                      .withOpacity(0.7)),
                                        ),
                                      ),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Seats Quantity',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .copyWith(
                                                fontWeight: FontWeight.w800),
                                      ),
                                    ),
                                    const Spacer(),
                                    CartStepper(
                                      size: 40,
                                      style: CartStepperStyle(
                                        buttonAspectRatio: 1,
                                        radius: const Radius.circular(10),
                                        activeBackgroundColor:
                                            AppColors.primaryColor,
                                        activeForegroundColor:
                                            AppColors.whiteColor,
                                        elevation: 0,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                              fontSize: 20,
                                            ),
                                      ),
                                      value: manageReservationProvider.seatsQty,
                                      didChangeCount: (int value) {
                                        //setter
                                        manageReservationProvider
                                            .setSeatsQty(value);
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  onTap: () async {
                                    await showCupertinoModalPopup<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          decoration: const BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.date,
                                            onDateTimeChanged: (value) {
                                              manageReservationProvider
                                                  .setReservationDate(value);
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  controller: manageReservationProvider
                                      .reservationDateController,
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select reservation date';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Select Date',
                                    suffixIcon: const Icon(
                                        FontAwesomeIcons.calendarDay,
                                        color: AppColors.primaryColor),
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: AppColors.textColor
                                                .withOpacity(0.5)),
                                    fillColor: AppColors.whiteColor,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                        color: AppColors.textColor
                                            .withOpacity(0.12),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                TextFormField(
                                  onTap: () async {
                                    await showCupertinoModalPopup<void>(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Container(
                                          decoration: const BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(12),
                                              topRight: Radius.circular(12),
                                            ),
                                          ),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.3,
                                          child: CupertinoDatePicker(
                                            mode: CupertinoDatePickerMode.time,
                                            onDateTimeChanged: (value) {
                                              manageReservationProvider
                                                  .setReservationTime(value);
                                            },
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  controller: manageReservationProvider
                                      .reservationTimeController,
                                  readOnly: true,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please select reservation time';
                                    } else {
                                      return null;
                                    }
                                  },
                                  decoration: InputDecoration(
                                    hintText: 'Select Time',
                                    suffixIcon: const Icon(
                                        FontAwesomeIcons.clock,
                                        color: AppColors.primaryColor),
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: AppColors.textColor
                                                .withOpacity(0.5)),
                                    fillColor: AppColors.whiteColor,
                                    filled: true,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: const BorderSide(
                                        color: AppColors.primaryColor,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                      borderSide: BorderSide(
                                        color: AppColors.textColor
                                            .withOpacity(0.12),
                                      ),
                                    ),
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
                                            .setBottomNavVisibility(true);
                                        AppDialog.showLoadingDialog(
                                            context, 'Adding...');

                                        await manageReservationProvider
                                            .createReservation(context);
                                        GoRouter.of(context).pop();
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Save'),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }).then((value) {
                  manageReservationProvider.clearControllers();
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
