import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/size.dart';

class RElevatedButtonTheme {
  RElevatedButtonTheme._(); // to avoid creating instances

  /* -- light mode(theme) -- */
  static final elevatedBtnLightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: rWhiteColor,
      backgroundColor: rSecondaryColor,
      side: const BorderSide(color: Colors.brown),
      padding: const EdgeInsets.symmetric(
        vertical: rButtonHeight * 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );

  /* -- dark mode(theme) -- */
  static final elevatedBtnDarkTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: rSecondaryColor,
      backgroundColor: rWhiteColor,
      side: const BorderSide(color: rWhiteColor),
      padding: const EdgeInsets.symmetric(
        vertical: rButtonHeight * 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}
