import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

ThemeData light({Color color = primaryColor, BuildContext? context}) =>
    ThemeData(
      useMaterial3: true,
      fontFamily: 'Nunito',
      primaryColor: color,
      secondaryHeaderColor: const Color(0xFF1ED7AA),
      disabledColor: const Color(0xFFBABFC4),
      scaffoldBackgroundColor: backgroundColorLight,
      brightness: Brightness.light,
      hintColor: const Color(0xFF7B8395),
      cardColor: cardColorLight, // 0xFFF6F6F6
      dividerColor: Colors.grey[300]!, //0xFFE8E8E8
      shadowColor: const Color(0xFFB6B6B6),
      textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(foregroundColor: color)),
      colorScheme: ColorScheme.light(primary: color, secondary: color).copyWith(
          background: const Color(0xFFFFFFFF),
          error: const Color(0xFFdd3135),
          outline: const Color(0xFFF4F4F4)),
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context!).textTheme.copyWith(
              displayLarge: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              displayMedium: TextStyle(
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              displaySmall: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              headlineLarge: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              headlineMedium: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              headlineSmall: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              bodyLarge: TextStyle(
                fontSize: 16.sp,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              bodyMedium: TextStyle(
                fontSize: 14.sp,
                color: const Color.fromRGBO(137, 137, 137, 1),
                fontFamily: 'Poppins',
              ),
              bodySmall: TextStyle(
                fontSize: 12.sp,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              titleLarge: TextStyle(
                fontSize: 10.sp,
                color: const Color.fromRGBO(207, 192, 176, 1),
                fontFamily: 'Poppins',
              ),
              titleMedium: TextStyle(
                fontSize: 8.sp,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              titleSmall: TextStyle(
                fontSize: 6.sp,
                color: const Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
            ),
      ),

      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 20,
        color: backgroundColorLight,
        surfaceTintColor: backgroundColorLight,
        shadowColor: backgroundColorLight,
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        titleTextStyle: GoogleFonts.nunito(
          color: Colors.black,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
