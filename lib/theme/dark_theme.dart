import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pallets_taxi_driver_pannel/utils/colors.dart';

ThemeData dark({Color color = primaryColor, BuildContext? context}) =>
    ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      primaryColor: color,
      disabledColor: const Color(0xffa2a7ad),
      scaffoldBackgroundColor: backgroundColorDark,
      brightness: Brightness.dark,
      hintColor: const Color(0xFFbebebe),
      cardColor: cardColorDark,
      dividerColor: Colors.grey[800]!,
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: color),
      ),
      colorScheme: ColorScheme.dark(primary: color, secondary: color).copyWith(
        background: const Color(0xFF1A1D1F),
        error: const Color(0xFFdd3135),
        outline: const Color(0xFF2C2C2C),
      ),
      textTheme: GoogleFonts.poppinsTextTheme(
        Theme.of(context!).textTheme.copyWith(
              displayLarge: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              displayMedium: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              displaySmall: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              headlineLarge: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              headlineMedium: const TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              headlineSmall: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              bodyMedium: const TextStyle(
                fontSize: 18,
                color: Color.fromRGBO(137, 137, 137, 1),
                fontFamily: 'Poppins',
              ),
              bodyLarge: const TextStyle(
                fontSize: 14,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              bodySmall: const TextStyle(
                fontSize: 12,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              titleLarge: const TextStyle(
                fontSize: 16,
                color: Color.fromRGBO(207, 192, 176, 1),
                fontFamily: 'Poppins',
              ),
              titleMedium: const TextStyle(
                fontSize: 10,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
              titleSmall: const TextStyle(
                fontSize: 8,
                color: Color.fromRGBO(42, 42, 42, 1),
                fontFamily: 'Poppins',
              ),
            ),
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        titleSpacing: 10,
        color: backgroundColorDark,
        surfaceTintColor: backgroundColorDark,
        shadowColor: backgroundColorDark,
        iconTheme: IconThemeData(color: Colors.white, size: 24),
        centerTitle: true,
      ),
    );
