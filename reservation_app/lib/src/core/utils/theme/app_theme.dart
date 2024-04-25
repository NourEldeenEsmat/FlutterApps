import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';
import 'package:reservation_app/src/core/utils/theme/text_theme.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
    primaryColor: AppColors.primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.textColor,
      ),
    ),
    textTheme: CustomTextTheme.lightTextThemeData,
    chipTheme: const ChipThemeData(
      selectedColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      backgroundColor: AppColors.whiteColor,
      labelStyle: TextStyle(color: AppColors.textColor),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.primaryColor),
      trackColor:
          MaterialStateProperty.all(AppColors.textColor.withOpacity(0.5)),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: AppColors.whiteColor,
      surfaceTintColor: AppColors.scaffoldBackgroundColor,
      rangePickerBackgroundColor: AppColors.primaryColor,
      rangePickerShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      todayBackgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      todayForegroundColor: MaterialStateProperty.all(AppColors.whiteColor),
      rangeSelectionBackgroundColor: AppColors.primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        side: BorderSide(color: AppColors.primaryColor),
      ),

      
    ),
    tabBarTheme: TabBarTheme(
      labelColor: AppColors.primaryColor,
      unselectedLabelColor: AppColors.textColor,
      indicatorColor: AppColors.primaryColor,
      dividerColor: AppColors.textColor.withOpacity(0.5),
    ),
  );
}
