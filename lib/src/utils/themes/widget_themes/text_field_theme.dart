import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';

class RTextFormFieldTheme {
  RTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: rSecondaryColor,
    floatingLabelStyle: TextStyle(
      color: rSecondaryColor,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: rSecondaryColor,
      ),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    border: OutlineInputBorder(),
    prefixIconColor: rPrimaryColor,
    floatingLabelStyle: TextStyle(
      color: rPrimaryColor,
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 2.0,
        color: rPrimaryColor,
      ),
    ),
  );
}
