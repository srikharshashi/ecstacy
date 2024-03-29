import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.black,
    backgroundColor: Colors.white,
    canvasColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      subtitle2: GoogleFonts.montserrat(
          fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black),
      headline1: GoogleFonts.pacifico(
          fontSize: 35, fontWeight: FontWeight.w300, color: Colors.black),
      headline2: GoogleFonts.pacifico(
          fontSize: 23, fontWeight: FontWeight.w300, color: Colors.black),
      bodyText2: TextStyle(color: Colors.black),
    ),
    tabBarTheme: TabBarTheme(unselectedLabelColor: Colors.black),
    appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: Colors.black),
        foregroundColor: Colors.black,
        actionsIconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle:
            GoogleFonts.pacifico(fontSize: 23, color: Colors.black)),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.purple[900],
    canvasColor: Color(0xFF121212),
    iconTheme: IconThemeData(color: Colors.white),
    textTheme: TextTheme(
      headline1: GoogleFonts.pacifico(
          fontSize: 35, fontWeight: FontWeight.w300, color: Colors.white),
      headline2: GoogleFonts.pacifico(
          fontSize: 23, fontWeight: FontWeight.w300, color: Colors.white),
      subtitle2: GoogleFonts.montserrat(
          fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white),
    ),
    tabBarTheme: TabBarTheme(),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.black,
      actionsIconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: GoogleFonts.pacifico(fontSize: 23, color: Colors.white),
    ),
  );
}
