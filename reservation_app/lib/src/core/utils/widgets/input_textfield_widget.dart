import 'package:flutter/material.dart';
import 'package:reservation_app/src/constants/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.leadingIcon,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.validator,
    this.trailingIcon,
    required this.topRightRadius,
    required this.bottomRightRadius,
  });

  final Icon leadingIcon;
  final String hintText;
  final bool obscureText;
  final Icon? trailingIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final double topRightRadius;
  final double bottomRightRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55,
      width: 280,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: AppColors.primaryColor,
        validator: validator,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
          hintText: hintText,
          errorStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.red,
                height: 0.0,
                fontSize: 12,
              ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRightRadius),
              bottomRight: Radius.circular(bottomRightRadius),
            ),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          prefixIcon: leadingIcon,
          suffixIconColor: AppColors.textColor.withOpacity(0.5),
          prefixIconColor: AppColors.textColor.withOpacity(0.5),
          hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.textColor.withOpacity(0.5),
              ),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: trailingIcon,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRightRadius),
              bottomRight: Radius.circular(bottomRightRadius),
            ),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRightRadius),
              bottomRight: Radius.circular(bottomRightRadius),
            ),
            borderSide: const BorderSide(
              color: Colors.grey,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(topRightRadius),
              bottomRight: Radius.circular(bottomRightRadius),
            ),
            borderSide: const BorderSide(
              color: AppColors.primaryColor,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}
