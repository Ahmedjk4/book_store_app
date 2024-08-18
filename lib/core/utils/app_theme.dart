import 'package:book_store/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: kPrimaryColor,
    textTheme:
        GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme).apply(
      bodyColor: HexColor('#FFFFFF'),
      displayColor: HexColor(
        '#FFFFFF',
      ),
    ),
  );
}
