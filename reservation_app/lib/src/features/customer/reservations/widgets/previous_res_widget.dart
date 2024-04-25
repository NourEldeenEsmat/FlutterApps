import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class PreviousReservationWidget extends StatelessWidget {
  PreviousReservationWidget(
      {super.key,
      required this.clubName,
      required this.clubType,
      required this.reservationDate,
      required this.reservationTime,
      required this.clubImage});

  final String clubName;
  final String clubType;
  final String reservationDate;
  final String reservationTime;
  final String clubImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 2,
          color: AppColors.textColor.withOpacity(0.12),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(17),
              bottomLeft: Radius.circular(17),
            ),
            child: Image.asset(
              clubImage,
              fit: BoxFit.cover,
              height: 150,
              width: 150,
            ),
          ),
          const SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(clubName),
                Text(clubType,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: AppColors.textColor.withOpacity(0.5),
                        )),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.calendar_today,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(reservationDate),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      CupertinoIcons.clock_fill,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 10),
                    Text(reservationTime),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
