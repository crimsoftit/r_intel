import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';

class TxtTheme {
  static TextTheme ligtTextTheme = const TextTheme(
    displayMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: Colors.brown,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: Colors.brown,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10,
      color: Colors.grey,
    ),
    // titleSmall: GoogleFonts.poppins(
    //   color: Colors.white60,
    //   fontSize: 24,
    // ),
  );
  static TextTheme darkTextTheme = const TextTheme(
    displayMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      color: Colors.white,
    ),
    titleSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 16,
      color: Colors.white,
    ),
  );
}
