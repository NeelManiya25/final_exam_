import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

List<Map<String, dynamic>> addedProducts = [];

class Global {
  static PageController pageController = PageController();

  static int currentPageIndex = 0;

  static TextStyle gilory36 = GoogleFonts.getFont(
    'Montserrat',
    fontSize: 36,
    color: Color(0xff000000),
  );

  static TextStyle size16 = GoogleFonts.getFont(
    'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xffFFFFFF),
  );

  static TextStyle size17black = GoogleFonts.getFont(
    'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xff000000),
  );

  static TextStyle size10 = GoogleFonts.getFont(
    'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Color(0xff000000),
  );

  static TextStyle size12red = GoogleFonts.getFont(
    'Montserrat',
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.red,
  );
}
