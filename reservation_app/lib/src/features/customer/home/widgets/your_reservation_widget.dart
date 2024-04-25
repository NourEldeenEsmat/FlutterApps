import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class YourReservationsWidget extends StatelessWidget {
  YourReservationsWidget(
      {super.key,
      required this.clubName,
      required this.clubType,
      required this.reservationDate,
      required this.reservationTime,
      required this.clubImage});

  String clubName;
  String clubType;
  String reservationDate;
  String reservationTime;
  String clubImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
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
                      'Cancel',
                      style: TextStyle(
                        color: AppColors.textColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                clubImage,
                fit: BoxFit.cover,
                height: 140,
                width: 135,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
