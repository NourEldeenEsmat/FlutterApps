import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class CardInputFieldWidget extends StatelessWidget {
  CardInputFieldWidget(
      {super.key, required this.controller, required this.updateValue, required this.labelText, required this.hintText});

  final String labelText;
  final String hintText;
  final TextEditingController controller;
  Function updateValue;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: AppColors.primaryColor,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: AppColors.textColor.withOpacity(0.5),
            ),
        fillColor: AppColors.whiteColor,
        focusColor: AppColors.primaryColor,
        floatingLabelStyle: const TextStyle(
          color: AppColors.primaryColor,
        ),
        filled: true,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.textColor.withOpacity(0.12),
          ),
        ),
        isDense: true,
      ),
      onChanged: (value) {
        updateValue(value);
      },
    );
  }
}
