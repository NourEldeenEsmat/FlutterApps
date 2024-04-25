import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class ClubWidget extends StatelessWidget {
  ClubWidget({
    super.key,
    required this.clubName,
    required this.clubType,
    required this.clubImage,
  });

  String clubName;
  String clubType;
  String clubImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push('/club_description_screen');
      },
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: Colors.black.withOpacity(0.12),
          ),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(19),
              child: Image.asset(
                clubImage,
                fit: BoxFit.cover,
                height: 180,
                width: double.infinity,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(clubName),
                      Text(
                        clubType,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.black.withOpacity(0.5),
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
