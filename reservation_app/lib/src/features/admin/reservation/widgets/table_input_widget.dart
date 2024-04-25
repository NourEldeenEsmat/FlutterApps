import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class ReservationInputWidget extends StatefulWidget {
  const ReservationInputWidget({super.key});

  @override
  State<ReservationInputWidget> createState() => _ReservationInputWidgetState();
}

class _ReservationInputWidgetState extends State<ReservationInputWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppColors.textColor,
          ),
      decoration: InputDecoration(
        labelText: 'Reservation Name',
        labelStyle: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: AppColors.textColor.withOpacity(0.6),
            ),
        fillColor: AppColors.whiteColor,
        filled: true,
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
    );
  }
}
