import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.white,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.darkSlate,
        primary: AppColors.darkSlate,
        secondary: AppColors.accentCyan,
        surface: AppColors.white,
      ),
      textTheme: GoogleFonts.urbanistTextTheme(),
    );
  }
}
