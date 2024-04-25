import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/admin/tables/providers/manage_tables_provider.dart';

import '../providers/dashboard_provider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<DashboardProvider>(context, listen: false).init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100),
          child: CustomAppBar(
            isBack: false,
            title: 'Dashboard',
            isAdminHome: true,
          ),
        ),
        body: SingleChildScrollView(
          child: Consumer<DashboardProvider>(
            builder: (context, dashboardProvider, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Insights',
                        style: Theme.of(context).textTheme.labelMedium),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Total Bookings',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .copyWith(
                                          color: AppColors.textColor
                                              .withOpacity(0.5))),
                              const SizedBox(height: 10),
                              Text(dashboardProvider.totalBookings.toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          height: 120,
                          width: MediaQuery.of(context).size.width / 2 - 30,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: AppColors.whiteColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Available Tables',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(
                                      color:
                                          AppColors.textColor.withOpacity(0.5),
                                    ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                  Provider.of<ManageTablesProvider>(context)
                                      .tables
                                      .where((element) =>
                                          element.tableStatus == "Available")
                                      .length
                                      .toString(),
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: AppColors.whiteColor,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Total Revenue',
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                              const SizedBox(height: 10),
                              Text(
                                "\$${dashboardProvider.totalRevenue.toString()}",
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    (dashboardProvider.recentReservation == null ||
                            dashboardProvider
                                .recentReservation!.reservationId.isEmpty)
                        ? const Center(
                            child: Text(
                              'No Reservations Yet',
                              style: TextStyle(color: AppColors.textColor),
                            ),
                          )
                        : Column(
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Recent Reservations',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium),
                                      const SizedBox(height: 10),
                                      Text('+1 new reservation',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                  color: AppColors.textColor
                                                      .withOpacity(0.5))),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("ID",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            const SizedBox(height: 10),
                                            Text(
                                              dashboardProvider
                                                  .recentReservation!
                                                  .reservationId,
                                              overflow: TextOverflow.ellipsis,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.textColor
                                                        .withOpacity(0.5),
                                                  ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text("Order Date",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            const SizedBox(height: 10),
                                            Text(
                                              dashboardProvider
                                                  .recentReservation!
                                                  .reservationDate,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.textColor
                                                        .withOpacity(0.5),
                                                  ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Table #",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            const SizedBox(height: 10),
                                            Text(
                                              //select table number from table Id
                                              dashboardProvider
                                                  .recentTableNumber,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.textColor
                                                        .withOpacity(0.5),
                                                  ),
                                            ),
                                            const SizedBox(height: 20),
                                            Text("Seats Qty",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium),
                                            const SizedBox(height: 10),
                                            Text(
                                              dashboardProvider
                                                  .recentReservation!
                                                  .reserveSeats,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium!
                                                  .copyWith(
                                                    fontSize: 14,
                                                    color: AppColors.textColor
                                                        .withOpacity(0.5),
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors
                                                .scaffoldBackgroundColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            child: Text(
                                              '\$50.00',
                                              style: TextStyle(
                                                color: AppColors.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const Spacer(),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: AppColors.greenBgColor,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 10,
                                            ),
                                            child: Text(
                                              dashboardProvider
                                                  .recentReservation!
                                                  .reservationStatus,
                                              style: const TextStyle(
                                                color: AppColors.greenColor,
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
