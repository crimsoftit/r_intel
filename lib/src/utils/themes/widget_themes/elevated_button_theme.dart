import 'package:flutter/material.dart';
import 'package:r_intel/src/constants/colors.dart';
import 'package:r_intel/src/constants/size.dart';

class RElevatedButtonTheme {
  RElevatedButtonTheme._(); // to avoid creating instances

  /* -- light mode(theme) -- */
  static final elevatedBtnLightTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: rWhiteColor,
      backgroundColor: rSecondaryColor,
      side: const BorderSide(color: rSecondaryColor),
      padding: const EdgeInsets.symmetric(
        vertical: rButtonHeight * 0.5,
      ),
    ),
  );

  /* -- dark mode(theme) -- */
  static final elevatedBtnDarkTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: rSecondaryColor,
      backgroundColor: rWhiteColor,
      side: const BorderSide(color: rSecondaryColor),
      padding: const EdgeInsets.symmetric(
        vertical: rButtonHeight * 0.5,
      ),
    ),
  );
}
