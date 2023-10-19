import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'colors.dart';

class MyThemeData {


  static ThemeData liteMode = ThemeData(
      scaffoldBackgroundColor: mint,

      textTheme: TextTheme(
        bodySmall: GoogleFonts.elMessiri(
          fontWeight: FontWeight.w400,
          fontSize: 20,
          color: Color(0xff242424),
        ),
        bodyMedium: GoogleFonts.elMessiri(
          fontWeight: FontWeight.w700,
          fontSize: 25,
          color: Color(0xffFFFFFF),
        ),
        bodyLarge: GoogleFonts.elMessiri(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Color(0xff242424),
        ),
      ),
      appBarTheme: AppBarTheme(


        elevation: 0.0,

      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey

      ));

  // static ThemeData darkTheme = ThemeData(
  //     scaffoldBackgroundColor: Colors.transparent,
  //
  //     textTheme: TextTheme(
  //       bodySmall: GoogleFonts.elMessiri(
  //         fontWeight: FontWeight.w400,
  //         fontSize: 20,
  //         color: Color(0xffFACC1D),
  //       ),
  //       bodyMedium: GoogleFonts.elMessiri(
  //         fontWeight: FontWeight.w700,
  //         fontSize: 25,
  //         color: Color(0xffFACC1D),
  //       ),
  //       bodyLarge: GoogleFonts.elMessiri(
  //         fontWeight: FontWeight.bold,
  //         fontSize: 30,
  //         color: Color(0xffffffff),
  //       ),
  //     ),
  //     appBarTheme: AppBarTheme(
  //       iconTheme: IconThemeData(color: Colors.white, size: 30),
  //       color: Colors.transparent,
  //       elevation: 0.0,
  //       centerTitle: true,
  //     ),
  //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //       backgroundColor: Color(0xff141A2E),
  //       type: BottomNavigationBarType.shifting,
  //       selectedItemColor: Color(0xffFACC1D),
  //       unselectedItemColor: Color(0xffF8F8F8),
  //     ));
}
