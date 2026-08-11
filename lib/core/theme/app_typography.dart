import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextStyle headingTitle = GoogleFonts.urbanist(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static TextStyle headingSub = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle inputText = GoogleFonts.urbanist(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static TextStyle inputHint = GoogleFonts.urbanist(
    fontSize: 15,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static TextStyle buttonPrimary = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  static TextStyle buttonSecondary = GoogleFonts.urbanist(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static TextStyle dividerText = GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textDivider,
  );

  static TextStyle linkCyan = GoogleFonts.urbanist(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.accentCyan,
  );

  static TextStyle linkDark = GoogleFonts.urbanist(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textDivider,
  );

  static TextStyle welcomeTitle = GoogleFonts.urbanist(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.white,
    letterSpacing: 0.3,
  );
}
