import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/tables/providers/table_description_provider.dart';
import 'package:reservation_app/src/features/customer/tables/providers/tables_provider.dart';

class TableDescriptionScreen extends StatelessWidget {
  TableDescriptionScreen({super.key});

  String totalPrice = '45';



  final List<String> _images = [
    'https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80',
    'https://images.unsplash.com/photo-1612594305265-86300a9a5b5b?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
    'https://images.unsplash.com/photo-1612626256634-991e6e977fc1?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1712&q=80',
    'https://images.unsplash.com/photo-1593642702749-b7d2a804fbcf?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerTablesProvider>(
      builder: (context, tablesProvider, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: CustomAppBar(
              isBack: true,
            ),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          'assets/images/restaurant.jpg',
                          height: 100,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Table 5',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            'NoHo’s Club',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: AppColors.textColor.withOpacity(0.5),
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.start,
                      children: [
                        Chip(
                          label: const Text('Feb 26th, 2024'),
                          backgroundColor: AppColors.whiteColor,
                          side: BorderSide(
                            color: AppColors.textColor.withOpacity(0.1),
                            width: 1,
                          ),
                          avatar: const Icon(
                            FontAwesomeIcons.calendarDays,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Chip(
                          label: const Text('12:20 PM'),
                          backgroundColor: AppColors.whiteColor,
                          side: BorderSide(
                            color: AppColors.textColor.withOpacity(0.1),
                            width: 1,
                          ),
                          avatar: const Icon(
                            FontAwesomeIcons.solidClock,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Chip(
                          label: const Text('3/8'),
                          backgroundColor: AppColors.whiteColor,
                          side: BorderSide(
                            color: AppColors.textColor.withOpacity(0.1),
                            width: 1,
                          ),
                          avatar: const Icon(
                            FontAwesomeIcons.userGroup,
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Description',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    tablesProvider.selectedTable!.tableDescription,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'People that joined',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                  const SizedBox(height: 5),
                  FlutterImageStack(
                    imageList: _images,
                    totalCount: 3,
                    itemRadius: 45,
                    itemCount: 3,
                    itemBorderWidth: 3, // Border width around the images
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Number of Seats',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: AppColors.textColor.withOpacity(0.1),
                              ),
                            ),
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<TableDescriptionProvider>(
                                            context,
                                            listen: false)
                                        .decrementSelectedSeatsCount();
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.all(2),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.textColor.withOpacity(0.5),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(50)),
                                    ),
                                    child: const Icon(
                                      Icons.remove,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    Provider.of<TableDescriptionProvider>(
                                            context)
                                        .selectedSeatsCount
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Provider.of<TableDescriptionProvider>(
                                            context,
                                            listen: false)
                                        .incrementSelectedSeatsCount();
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    margin: const EdgeInsets.all(2),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    child: const Icon(
                                      Icons.add,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '1 seat left',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                  color: AppColors.primaryColor,
                                ),
                          ),
                        ],
                      )
                    ],
                  ),

                  const SizedBox(height: 20),

                  //check box with text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (bool? value) {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        activeColor: AppColors.primaryColor,
                        side: BorderSide(
                          color: AppColors.textColor.withOpacity(0.5),
                        ),
                        checkColor: AppColors.whiteColor,
                        fillColor: MaterialStateProperty.resolveWith((states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppColors.primaryColor;
                          }
                          return AppColors.whiteColor;
                        }),
                      ),
                      Text(
                        'Pay the difference if table is not full',
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: AppColors.textColor.withOpacity(0.5),
                  blurRadius: 10,
                  spreadRadius: -5,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Total: \$$totalPrice',
                    style: Theme.of(context).textTheme.titleMedium),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.whiteColor,
                    textStyle: Theme.of(context).textTheme.labelMedium,
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    GoRouter.of(context).push('/payment_screen');
                  },
                  child: const Text('Proceed'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
