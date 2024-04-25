import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/widgets/custom_appbar.dart';
import 'package:reservation_app/src/features/customer/home/widgets/available_tables.dart';
import 'package:reservation_app/src/features/customer/home/widgets/popular_clubs_widget.dart';
import 'package:reservation_app/src/features/customer/home/widgets/scoreboard_widget.dart';
import 'package:reservation_app/src/features/customer/home/widgets/your_reservation_widget.dart';
import 'package:reservation_app/src/features/customer/reservations/providers/reservation_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: CustomAppBar(
          isBack: false,
          isHome: true,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Location',
                      textAlign: TextAlign.start,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          'assets/icons/location_icon.svg',
                          height: 20,
                        ),
                        const SizedBox(width: 10),
                        Text('New York, USA',
                            style: Theme.of(context).textTheme.titleSmall),
                        const SizedBox(width: 10),
                        const Icon(
                          FontAwesomeIcons.angleDown,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Your Reservations',
                                style: Theme.of(context).textTheme.titleMedium),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push('/reservation_screen');
                              },
                              child: Text(
                                'See All',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 155,
                      child: Consumer<ReservationProvider>(
                        builder: (context, reservationProvider, child) {
                          return reservationProvider.reservations.isNotEmpty
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return YourReservationsWidget(
                                      clubName: 'NoHo’s Club',
                                      clubType: 'American Club',
                                      reservationDate: 'Feb 26th, 2024',
                                      reservationTime: '12:20 PM',
                                      clubImage: 'assets/images/restaurant.jpg',
                                    );
                                  },
                                  separatorBuilder: (context, index) {
                                    return const SizedBox(width: 5);
                                  },
                                )
                              : SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Icon(
                                        Icons.event_busy,
                                        size: 40,
                                        color: AppColors.textColor,
                                      ),
                                      const SizedBox(height: 16),
                                      Text(
                                        'No Reservations, Book Now!',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                    ],
                                  ),
                                );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Popular Clubs',
                                style: Theme.of(context).textTheme.titleMedium),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                GoRouter.of(context).push('/club_screen');
                              },
                              child: Text(
                                'See All',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ChoiceChip(
                            label: const Text('Cuisines'),
                            selected: false,
                            onSelected: (value) {},
                          ),
                          const SizedBox(width: 10),
                          ChoiceChip(
                            label: const Text('Nearest'),
                            selected: true,
                            onSelected: (value) {},
                          ),
                          const SizedBox(width: 10),
                          ChoiceChip(
                            label: const Text('Great Offers'),
                            selected: true,
                            onSelected: (value) {},
                          ),
                          const SizedBox(width: 10),
                          ChoiceChip(
                            label: const Text('Ratings 4.5+'),
                            selected: true,
                            onSelected: (value) {},
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 255,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return PopularClubsWidget(
                            clubName: 'NoHo’s Club',
                            clubType: 'American Club',
                            clubImage: 'assets/images/restaurant.jpg',
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 5);
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text('Available Tables',
                                style: Theme.of(context).textTheme.titleMedium),
                            const Spacer(),
                            TextButton(
                              onPressed: () {
                                GoRouter.of(context).push('/tables_screen');
                              },
                              child: Text(
                                'See All',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: AppColors.primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: SizedBox(
                      height: 180,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return AvailableTablesWidget(
                            tableName: 'Table 5',
                            clubName: 'NoHo’s Club',
                            reservationDate: 'Feb 26th, 2024',
                            reservationTime: '12:20 PM',
                            seats: "3/8",
                            clubImage: 'assets/images/restaurant.jpg',
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(width: 5);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              //scoreboard
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text('Scoreboard',
                        style: Theme.of(context).textTheme.titleMedium),
                    const SizedBox(height: 10),
                    Container(
                      height: 300,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppColors.textColor.withOpacity(0.12),
                          width: 2,
                        ),
                        color: AppColors.whiteColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(
                              "Top 3 Spenders",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                            const SizedBox(height: 10),
                            ListView.separated(
                              shrinkWrap: true,
                              itemCount: 3,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) {
                                return const SizedBox(height: 10);
                              },
                              itemBuilder: (context, index) {
                                return ScoreboardWidget(
                                  scoreId: (index + 1).toString(),
                                  userName: 'James A.',
                                  userScore: '657',
                                  clubName: 'LAVO Night Club',
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
