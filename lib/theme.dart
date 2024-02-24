import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    primaryColor: const Color.fromRGBO(255, 225, 114, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(14, 51, 61, 1),
    primaryColorLight: const Color.fromRGBO(229, 229, 229, 1),
    primaryColorDark: const Color.fromRGBO(129, 129, 129, 1),
    errorColor: const Color.fromRGBO(243, 104, 104, 1), //紅色
    indicatorColor: const Color.fromRGBO(104, 243, 168, 1), //綠色
    backgroundColor: Colors.white,
    primaryTextTheme: TextTheme(
      headline1: GoogleFonts.limelight(
        color: const Color.fromRGBO(229, 229, 229, 1),
        fontSize: 30,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
      headline2: GoogleFonts.amaranth(
        color: const Color.fromRGBO(229, 229, 229, 1),
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      ),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.limelight(
        color: const Color.fromRGBO(129, 129, 129, 1),
        fontSize: 30,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
      headline2: GoogleFonts.amaranth(
        color: const Color.fromRGBO(129, 129, 129, 1),
        fontSize: 20,
        fontWeight: FontWeight.w600,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: GoogleFonts.amaranth(
        color: const Color.fromRGBO(14, 51, 61, 1),
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
  static final dark = ThemeData.dark().copyWith(
    primaryColor: const Color.fromRGBO(255, 225, 114, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(14, 51, 61, 1),
    primaryColorLight: const Color.fromRGBO(229, 229, 229, 1),
    primaryColorDark: const Color.fromRGBO(129, 129, 129, 1),
    errorColor: const Color.fromRGBO(243, 104, 104, 1), //紅色
    indicatorColor: const Color.fromRGBO(104, 243, 168, 1), //綠色
    backgroundColor: Colors.white,
    primaryTextTheme: TextTheme(
      headline1: GoogleFonts.limelight(
        color: const Color.fromRGBO(229, 229, 229, 1),
        fontSize: 30,
        fontWeight: FontWeight.w100,
        fontStyle: FontStyle.normal,
      ),
      headline2: GoogleFonts.amaranth(
        color: const Color.fromRGBO(229, 229, 229, 1),
        fontSize: 20,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
    ),
    textTheme: TextTheme(
      headline1: GoogleFonts.limelight(
        color: const Color.fromRGBO(129, 129, 129, 1),
        fontSize: 30,
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ),
      headline2: GoogleFonts.amaranth(
        color: const Color.fromRGBO(129, 129, 129, 1),
        fontSize: 20,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ),
      bodyText1: GoogleFonts.amaranth(
        color: const Color.fromRGBO(229, 229, 229, 1),
        fontSize: 20,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
  );
}
