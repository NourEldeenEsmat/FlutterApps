import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/admin/main/providers/admin_main_provider.dart';
import 'package:reservation_app/src/features/admin/presets/providers/preset_provider.dart';
import 'package:reservation_app/src/features/admin/tables/widgets/search_filter_widget.dart';
import 'package:reservation_app/src/features/admin/tables/widgets/table_input_widget.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ManagePresetScreen extends StatefulWidget {
  const ManagePresetScreen({Key? key}) : super(key: key);

  @override
  State<ManagePresetScreen> createState() => _ManagePresetScreenState();
}

class _ManagePresetScreenState extends State<ManagePresetScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<PresetProvider>(context, listen: false).init();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            isBack: false,
            title: 'Table Presets',
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
                  allowSwiping: true,
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
                        Provider.of<PresetProvider>(context, listen: false)
                            .reservations
                            .removeAt(rowIndex);
                        Provider.of<PresetProvider>(context, listen: false)
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
                  source: Provider.of<PresetProvider>(context)
                      .reservationDataSource,
                  columns: Provider.of<PresetProvider>(context).getColumns(),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: AppColors.textColor,
          onPressed: () {
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
                            'Preset Details',
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
                                labelText: 'Preset Name',
                                controller: TextEditingController(),
                              ),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              child: TableInputWidget(
                                labelText: 'Preset Description',
                                controller: TextEditingController(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Flexible(
                              child: TableInputWidget(
                                labelText: 'Preset Capacity',
                                controller: TextEditingController(),
                              ),
                            ),
                            SizedBox(width: 20),
                            Flexible(
                              child: TableInputWidget(
                                labelText: 'Preset Price',
                                controller: TextEditingController(),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Switch(
                              activeColor: AppColors.primaryColor,
                              activeTrackColor:
                                  AppColors.primaryColor.withOpacity(0.5),
                              value: true,
                              onChanged: (value) {},
                            ),
                            const SizedBox(width: 10),
                            const Text('Available'),
                          ],
                        ),
                        const SizedBox(height: 20),
                        //details
                        Flexible(
                          child: TextField(
                            style: Theme.of(context).textTheme.labelMedium,
                            maxLines: 5,
                            decoration: InputDecoration(
                              labelText: 'Table Description',
                              labelStyle: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                    color: AppColors.textColor.withOpacity(0.6),
                                  ),
                              fillColor: AppColors.whiteColor,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColors.textColor.withOpacity(0.12),
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: BorderSide(
                                  color: AppColors.textColor.withOpacity(0.12),
                                ),
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
                              onPressed: () {
                                Provider.of<AdminMainProvider>(context,
                                        listen: false)
                                    .setBottomNavVisibility(true);
                                Navigator.of(context).pop();
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
      ),
    );
  }
}
