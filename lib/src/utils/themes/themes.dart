import 'package:flutter/material.dart';
import 'package:r_intel/src/utils/themes/widget_themes/elevated_button_theme.dart';
import 'package:r_intel/src/utils/themes/widget_themes/outlined_btn_theme.dart';
import 'package:r_intel/src/utils/themes/widget_themes/txt_theme.dart';
//import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TxtTheme.ligtTextTheme,
    outlinedButtonTheme: ROutlinedButtonTheme.outlinedBtnLightTheme,
    elevatedButtonTheme: RElevatedButtonTheme.elevatedBtnLightTheme,
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TxtTheme.darkTextTheme,
    outlinedButtonTheme: ROutlinedButtonTheme.outlinedBtnLightTheme,
    elevatedButtonTheme: RElevatedButtonTheme.elevatedBtnDarkTheme,
  );
}
