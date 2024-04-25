import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class ClubInputWidget extends StatelessWidget {
  ClubInputWidget(
      {super.key, required this.labelText, required this.controller});

  String labelText;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65,
      child: TextField(
        controller: controller,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: AppColors.textColor,
            ),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: AppColors.textColor.withOpacity(0.6),
              ),
          fillColor: AppColors.whiteColor,
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: AppColors.primaryColor.withOpacity(0.6),
            ),
          ),
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
    );
  }
}
