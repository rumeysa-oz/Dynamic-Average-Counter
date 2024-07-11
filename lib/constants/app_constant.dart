import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Constants {
  static const MaterialColor primaryColor = Colors.indigo;

  static const String titleText = 'Average Calculate';

  static final TextStyle titleStyle = GoogleFonts.quicksand(
    fontSize: 25,
    fontWeight: FontWeight.w900,
    color: primaryColor,
  );

  static BorderRadius borderRadius = BorderRadius.circular(20);

  static final TextStyle coursesNumberStyle = GoogleFonts.quicksand(
    fontSize: 15,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );

  static final TextStyle averageStyle = GoogleFonts.quicksand(
    fontSize: 55,
    fontWeight: FontWeight.w800,
    color: primaryColor,
  );

  static final TextStyle averageTextStyle = GoogleFonts.quicksand(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: primaryColor,
  );

  static final dropDownPadding =
      EdgeInsets.symmetric(vertical: 8, horizontal: 16);

  static final horizontalPadding8 = EdgeInsets.symmetric(horizontal: 8);
}
