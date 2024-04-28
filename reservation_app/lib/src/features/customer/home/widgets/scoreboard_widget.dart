import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class ScoreboardWidget extends StatelessWidget {
  ScoreboardWidget(
      {super.key,
      required this.userName,
      required this.userScore,
      required this.scoreId,
      required this.clubName});

  String scoreId;
  String userName;
  String userScore;
  String clubName;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: AppColors.canvasColor,
        border: Border.all(
          color: AppColors.textColor.withOpacity(0.12),
          width: 2,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            Text(
              scoreId,
              style: const TextStyle(color: AppColors.textColor),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  style: const TextStyle(color: AppColors.textColor),
                ),
                Text(
                  clubName,
                  style: TextStyle(color: AppColors.textColor.withOpacity(0.5)),
                ),
              ],
            ),
            const Spacer(),
            Text(
              userScore,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: AppColors.primaryColor),
            ),
            const SizedBox(width: 10),
            const Icon(FontAwesomeIcons.trophy,
                color: AppColors.trophyColor, size: 20),
          ],
        ),
      ),
    );
  }
}
