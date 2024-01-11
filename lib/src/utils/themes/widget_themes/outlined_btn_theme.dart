import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/size.dart';

class ROutlinedButtonTheme {
  ROutlinedButtonTheme._(); // to avoid creating instances

  /* -- light mode (theme) -- */
  static final outlinedBtnLightTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: rSecondaryColor,
      side: const BorderSide(color: Colors.brown),
      padding: const EdgeInsets.symmetric(
        vertical: rButtonHeight * 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );

  /* -- dark mode (theme)) -- */
  static final outlinedBtnDarkTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: rWhiteColor,
      side: const BorderSide(color: Colors.white),
      padding: const EdgeInsets.symmetric(
        vertical: rButtonHeight * 0.5,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
    ),
  );
}
