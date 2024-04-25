import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class AvailableTablesWidget extends StatelessWidget {
  const AvailableTablesWidget(
      {super.key,
      required this.tableName,
      required this.clubName,
      required this.reservationDate,
      required this.reservationTime,
      required this.reservedSeats,
      required this.totalSeats,
      required this.clubImage});

  final String tableName;
  final String clubName;
  final String reservationDate;
  final String reservationTime;
  final int reservedSeats;
  final int totalSeats;
  final String clubImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/table_description_screen', extra: {
          'tableName': tableName,
          'clubName': clubName,
          'reservationDate': reservationDate,
          'reservationTime': reservationTime,
          'reservedSeats': reservedSeats,
          'totalSeats': totalSeats,
          'clubImage': clubImage,
        });
      },
      child: Container(
        width: 360,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: AppColors.textColor.withOpacity(0.12),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  clubImage,
                  fit: BoxFit.cover,
                  height: 170,
                  width: 170,
                ),
              ),
              const SizedBox(width: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      tableName,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(clubName,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.textColor.withOpacity(0.5),
                            )),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       FontAwesomeIcons.calendar,
                    //       color: AppColors.primaryColor,
                    //       size: 20,
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Text(reservationDate),
                    //   ],
                    // ),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       FontAwesomeIcons.clock,
                    //       color: AppColors.primaryColor,
                    //       size: 20,
                    //     ),
                    //     const SizedBox(width: 10),
                    //     Text(reservationTime),
                    //   ],
                    // ),
                    Row(
                      children: [
                        const Icon(
                          CupertinoIcons.person_2_fill,
                          color: AppColors.primaryColor,
                          size: 20,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '$reservedSeats/$totalSeats',
                          style:
                              Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.textColor.withOpacity(0.5),
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.textColor.withOpacity(0.12),
                        ),
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        'Book',
                        style: TextStyle(
                          color: AppColors.textColor,
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
