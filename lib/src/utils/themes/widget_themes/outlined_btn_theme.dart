import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/size.dart';

class ROutlinedButtonTheme {
  ROutlinedButtonTheme._(); // to avoid creating instances

  /* -- light mode (theme) -- */
  static final outlinedBtnLightTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: rSecondaryColor,
      side: const BorderSide(color: rSecondaryColor),
      padding: const EdgeInsets.symmetric(
        vertical: rButtonHeight * 0.5,
      ),
    ),
  );

  /* -- dark mode (theme)) -- */
  static final outlinedBtnDarkTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: rWhiteColor,
      side: const BorderSide(color: rWhiteColor),
      padding: const EdgeInsets.symmetric(
        vertical: rButtonHeight * 0.5,
      ),
    ),
  );
}
