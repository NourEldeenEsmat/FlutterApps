import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/features/customer/home/widgets/scoreboard_widget.dart';

class LocalScoreboardView extends StatefulWidget {
  const LocalScoreboardView({super.key});

  @override
  State<LocalScoreboardView> createState() => _LocalScoreboardViewState();
}

class _LocalScoreboardViewState extends State<LocalScoreboardView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Container(
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
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: 15,
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
        ),
      ),
    );
  }
}
