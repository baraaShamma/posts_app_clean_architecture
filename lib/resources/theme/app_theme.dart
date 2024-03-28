import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:posts_app_clean_architecture/app/constant/colors.dart';

enum AppTheme {
  light("Light"),
  dark("Dark");

  const AppTheme(this.name);

  final String name;
}

final appThemeData = {
  AppTheme.light:ThemeData(
    textTheme: TextTheme(
      titleSmall: GoogleFonts.amiri(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
      titleMedium: GoogleFonts.amiri(
        fontSize: 25,
        fontStyle: FontStyle.italic,
      ),
      bodyMedium: GoogleFonts.amiri(
        fontSize: 20,
        fontStyle: FontStyle.italic,
      ),
      headlineSmall: GoogleFonts.amiri(
        fontSize: 12,
        fontStyle: FontStyle.normal,
        // shadows: [Shadow(blurRadius: 2)]
      ),
    ),
    primaryColor: AppColor.primaryColorLight,
    cardColor: AppColor.white,
    colorScheme: const ColorScheme(
      secondary: AppColor.primaryColorLight,
      brightness: Brightness.light,
      background: AppColor.backgroundColorLight,
      primary: AppColor.primaryColorLight,
      error: Colors.white,
      onBackground: Colors.black,
      onError: Colors.white,
      onPrimary: AppColor.primaryColorLight,
      onSecondary: AppColor.primaryColorLight,
      onSurface: AppColor.black,
      surface: Colors.white,
    ),
    brightness: Brightness.light,
  ),
  AppTheme.dark: ThemeData(
    appBarTheme: AppBarTheme(backgroundColor: Colors.red[700]),
    brightness: Brightness.dark,
    primaryColor: Colors.white,
  ),
};
