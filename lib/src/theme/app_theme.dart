import 'package:fipe_consultation/src/constants/colors_constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData baseTheme = ThemeData(
    // Font
    fontFamily: GoogleFonts.inter().fontFamily,
    useMaterial3: true,
  );

  static ThemeData lightTheme = baseTheme.copyWith(
    // Scaffold
    scaffoldBackgroundColor: LightColorsConstants.primary,

    // Color
    colorScheme: const ColorScheme.light(
      primary: LightColorsConstants.primary,
      onPrimary: LightColorsConstants.onPrimary,
      secondary: LightColorsConstants.secondary,
      onSecondary: LightColorsConstants.onSecondary,
      error: LightColorsConstants.alert,
      surface: LightColorsConstants.surface,
      onSurface: LightColorsConstants.primary,
    ),

    // Text
    textTheme: const TextTheme(
      // App Bar
      titleSmall: TextStyle(
        color: LightColorsConstants.onPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),

      // Heading
      labelLarge: TextStyle(
        color: LightColorsConstants.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),

      // Title
      labelMedium: TextStyle(
        color: LightColorsConstants.onPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      // Subtitle
      labelSmall: TextStyle(
        color: LightColorsConstants.onPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Text Selection
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: LightColorsConstants.primary.withOpacity(0.2),
      selectionHandleColor: LightColorsConstants.primary,
    ),

    // Icon
    iconTheme: const IconThemeData(
      color: LightColorsConstants.onPrimary,
      size: 28.0,
    ),
  );

  static ThemeData darkTheme = baseTheme.copyWith(
    // Scaffold
    scaffoldBackgroundColor: DarkColorsConstants.primary,

    // Color
    colorScheme: baseTheme.colorScheme.copyWith(
      primary: DarkColorsConstants.primary,
      onPrimary: DarkColorsConstants.onPrimary,
      secondary: DarkColorsConstants.secondary,
      onSecondary: DarkColorsConstants.onSecondary,
      error: DarkColorsConstants.alert,
      surface: DarkColorsConstants.surface,
      onSurface: DarkColorsConstants.primary,
    ),

    // Text
    textTheme: const TextTheme(
      // App Bar
      titleSmall: TextStyle(
        color: DarkColorsConstants.onPrimary,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),

      // Heading
      labelLarge: TextStyle(
        color: DarkColorsConstants.onPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),

      // Title
      labelMedium: TextStyle(
        color: DarkColorsConstants.onPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),

      // Subtitle
      labelSmall: TextStyle(
        color: DarkColorsConstants.onPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    ),

    // Text Selection
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: DarkColorsConstants.primary.withOpacity(0.2),
      selectionHandleColor: DarkColorsConstants.primary,
    ),

    // Icon
    iconTheme: const IconThemeData(
      color: DarkColorsConstants.onPrimary,
      size: 28.0,
    ),
  );
}
