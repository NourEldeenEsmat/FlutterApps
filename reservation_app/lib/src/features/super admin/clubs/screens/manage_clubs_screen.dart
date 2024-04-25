import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/app_dialogs.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/admin/main/providers/admin_main_provider.dart';
import 'package:reservation_app/src/features/admin/tables/widgets/search_filter_widget.dart';
import 'package:reservation_app/src/features/admin/tables/widgets/table_input_widget.dart';
import 'package:reservation_app/src/features/super%20admin/clubs/models/admin_search_model.dart';
import 'package:reservation_app/src/features/super%20admin/clubs/providers/manage_clubs_provider.dart';
import 'package:reservation_app/src/features/super%20admin/clubs/widgets/club_input_widget.dart';
import 'package:reservation_app/src/features/super%20admin/main/providers/super_admin_main_provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ManageClubScreen extends StatefulWidget {
  const ManageClubScreen({Key? key}) : super(key: key);

  @override
  State<ManageClubScreen> createState() => _ManageClubScreenState();
}

class _ManageClubScreenState extends State<ManageClubScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ManageClubProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<ManageClubProvider>(
        builder: (context, manageClubProvider, child) {
          return Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(100),
              child: CustomAppBar(
                isBack: false,
                title: 'Manage Clubs',
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
                  manageClubProvider.clubs.isNotEmpty
                      ? Expanded(
                          child: SfDataGrid(
                            allowSwiping: true,
                            swipeMaxOffset: 80.0,
                            allowSorting: true,
                            startSwipeActionsBuilder: (BuildContext context,
                                DataGridRow row, int rowIndex) {
                              return GestureDetector(
                                onTap: () async {
                                  Provider.of<AdminMainProvider>(context,
                                          listen: false)
                                      .setBottomNavVisibility(false);
                                  var clubId = manageClubProvider
                                      .clubs[rowIndex].clubId
                                      .toString();
                                  await manageClubProvider.getClubById(clubId);
                                  await manageClubProvider.getAllSearchAdmin();
                                  showModalBottomSheet<dynamic>(
                                      isScrollControlled: true,
                                      context: context,
                                      builder: (BuildContext bc) {
                                        return Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.75,
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
                                                  'Club Details',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          fontWeight:
                                                              FontWeight.w800),
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Flexible(
                                                child: ClubInputWidget(
                                                  labelText: 'Club Name',
                                                  controller: manageClubProvider
                                                      .clubNameController,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Flexible(
                                                child: ClubInputWidget(
                                                  labelText: 'Club Location',
                                                  controller: manageClubProvider
                                                      .clubLocationController,
                                                ),
                                              ),
                                              const SizedBox(height: 20),
                                              Flexible(
                                                child: ClubInputWidget(
                                                  labelText: 'Club Type',
                                                  controller: manageClubProvider
                                                      .clubTypeController,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              CustomDropdown<Admin>.search(
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
                                                initialItem: manageClubProvider
                                                    .searchAdmins
                                                    .firstWhere(
                                                  (element) {
                                                    return element.id ==
                                                        manageClubProvider
                                                            .clubAdminController
                                                            .text;
                                                  },
                                                ),
                                                items: manageClubProvider
                                                    .searchAdmins,
                                                onChanged: (value) {
                                                  manageClubProvider
                                                      .setClubAdmin(value.id);
                                                },
                                              ),
                                              const SizedBox(height: 20),
                                              InternationalPhoneNumberInput(
                                                errorMessage:
                                                    'Invalid phone number',
                                                onInputChanged:
                                                    (PhoneNumber number) {
                                                  manageClubProvider
                                                      .setPhoneNumber(number);
                                                },
                                                onInputValidated: (bool value) {
                                                  manageClubProvider
                                                          .isValidPhoneNumber =
                                                      value;
                                                },
                                                selectorConfig:
                                                    const SelectorConfig(
                                                  selectorType:
                                                      PhoneInputSelectorType
                                                          .DIALOG,
                                                  trailingSpace: false,
                                                  showFlags: true,
                                                ),
                                                spaceBetweenSelectorAndTextField:
                                                    10,
                                                searchBoxDecoration:
                                                    InputDecoration(
                                                  hintText:
                                                      'Search by country name',
                                                  hintStyle: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .copyWith(
                                                          color: AppColors
                                                              .textColor),
                                                  fillColor:
                                                      AppColors.whiteColor,
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    borderSide: BorderSide(
                                                      color: AppColors.textColor
                                                          .withOpacity(0.12),
                                                    ),
                                                  ),
                                                ),
                                                autoValidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                // Autovalidate on user interaction
                                                selectorTextStyle:
                                                    const TextStyle(
                                                        color: Colors.black),
                                                validator: (String? value) {
                                                  if (value == null ||
                                                      value.isEmpty) {
                                                    return 'Please enter a phone number';
                                                  } else if (!manageClubProvider
                                                      .isValidPhoneNumber) {
                                                    return 'Invalid phone number';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                inputDecoration:
                                                    InputDecoration(
                                                  hintText: 'XXX XXXXXXX',
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
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    borderSide:
                                                        const BorderSide(
                                                      color: AppColors
                                                          .primaryColor,
                                                    ),
                                                  ),
                                                  filled: true,
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
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
                                                      Navigator.of(context)
                                                          .pop();
                                                      var clubId =
                                                          manageClubProvider
                                                              .clubs[rowIndex]
                                                              .clubId
                                                              .toString();
                                                      AppDialog
                                                          .showLoadingDialog(
                                                              context,
                                                              'Saving...');
                                                      await manageClubProvider
                                                          .updateClub(clubId);
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
                                  AppDialog.showLoadingDialog(
                                      context, "Deleting...");
                                  var clubId = manageClubProvider
                                      .clubs[rowIndex].clubId
                                      .toString();
                                  await manageClubProvider.deleteClub(clubId);
                                  Provider.of<ManageClubProvider>(context,
                                          listen: false)
                                      .updateDataGridSource();
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
                            source: manageClubProvider.manageClubDataSource,
                            columns: manageClubProvider.getColumns(),
                          ),
                        )
                      : const Expanded(
                          child: Center(
                            child: Text("No  Clubs"),
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
                await manageClubProvider.getAllSearchAdmin();
                showModalBottomSheet<dynamic>(
                    isScrollControlled: true,
                    context: context,
                    builder: (BuildContext bc) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.75,
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
                                'Club Details',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(fontWeight: FontWeight.w800),
                              ),
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: ClubInputWidget(
                                labelText: 'Club Name',
                                controller:
                                    manageClubProvider.clubNameController,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: ClubInputWidget(
                                labelText: 'Club Location',
                                controller:
                                    manageClubProvider.clubLocationController,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Flexible(
                              child: ClubInputWidget(
                                labelText: 'Club Type',
                                controller:
                                    manageClubProvider.clubTypeController,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomDropdown<Admin>.search(
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
                              items: manageClubProvider.searchAdmins,
                              onChanged: (value) {
                                manageClubProvider.setClubAdmin(value.id);
                              },
                            ),
                            const SizedBox(height: 20),
                            InternationalPhoneNumberInput(
                              errorMessage: 'Invalid phone number',
                              onInputChanged: (PhoneNumber number) {
                                manageClubProvider.setPhoneNumber(number);
                              },
                              onInputValidated: (bool value) {
                                manageClubProvider.isValidPhoneNumber = value;
                              },
                              selectorConfig: const SelectorConfig(
                                selectorType: PhoneInputSelectorType.DIALOG,
                                trailingSpace: false,
                                showFlags: true,
                              ),
                              spaceBetweenSelectorAndTextField: 10,
                              searchBoxDecoration: InputDecoration(
                                hintText: 'Search by country name',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: AppColors.textColor),
                                fillColor: AppColors.whiteColor,
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color:
                                        AppColors.textColor.withOpacity(0.12),
                                  ),
                                ),
                              ),
                              autoValidateMode:
                                  AutovalidateMode.onUserInteraction,
                              // Autovalidate on user interaction
                              selectorTextStyle:
                                  const TextStyle(color: Colors.black),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter a phone number';
                                } else if (!manageClubProvider
                                    .isValidPhoneNumber) {
                                  return 'Invalid phone number';
                                } else {
                                  return null;
                                }
                              },
                              inputDecoration: InputDecoration(
                                hintText: 'XXX XXXXXXX',
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                        color: AppColors.textColor
                                            .withOpacity(0.5)),
                                fillColor: AppColors.whiteColor,
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: const BorderSide(
                                    color: AppColors.primaryColor,
                                  ),
                                ),
                                filled: true,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                  borderSide: BorderSide(
                                    color:
                                        AppColors.textColor.withOpacity(0.12),
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
                                    Navigator.of(context).pop();
                                    AppDialog.showLoadingDialog(
                                        context, 'Adding Club...');
                                    await manageClubProvider
                                        .createClub(context);
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
