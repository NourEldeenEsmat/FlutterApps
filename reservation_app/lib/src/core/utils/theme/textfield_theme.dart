import 'package:flutter/material.dart';

class CustomTextFieldTheme {
  static final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    constraints: const BoxConstraints(
      maxHeight: 50.0,
    ),
    fillColor: Colors.white,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.black87,
        width: 1.0,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colors.black87,
        width: 1.0,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 20.0,
      vertical: 10.0,
    ),
    labelStyle: const TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
    hintStyle: const TextStyle(
      color: Colors.black87,
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
    ),
  );
}
