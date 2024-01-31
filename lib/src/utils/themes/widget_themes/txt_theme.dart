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
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: Colors.brown,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10,
      color: Colors.grey,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 9,
      color: Colors.brown,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 8,
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
    bodyMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 12,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    ),
    bodySmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 10,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 9,
      color: Colors.white,
    ),
    labelSmall: TextStyle(
      fontFamily: 'Poppins',
      fontSize: 8,
      color: Colors.grey,
    ),
  );
}
