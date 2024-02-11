import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';

class RTextFormFieldTheme {
  RTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    prefixIconColor: rBrown,
    floatingLabelStyle: const TextStyle(
      color: rBrown,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: rBrown,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    prefixIconColor: rPrimaryColor,
    floatingLabelStyle: const TextStyle(
      color: rPrimaryColor,
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        //color: rPrimaryColor,
        color: rBrown,
      ),
    ),
  );
}
