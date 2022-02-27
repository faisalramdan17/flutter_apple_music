import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  /// For Light Mode
  //
  static final ThemeData lightTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.light,
    primaryColor: Colors.lightBlue[800],

    // Define the default font family.
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );

  /// For Dark Mode
  //
  static final ThemeData darkTheme = ThemeData(
    // Define the default brightness and colors.
    brightness: Brightness.dark,
    primaryColor: const Color(0xFF19191A),

    // Define the default font family.
    fontFamily: GoogleFonts.montserrat().fontFamily,
  );
}
