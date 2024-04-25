import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class CustomElevatedButtonTheme {
  static ElevatedButtonThemeData elevatedButtonThemeData =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 55),
      backgroundColor: AppColors.primaryColor,
      foregroundColor: Colors.black,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.black87, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
