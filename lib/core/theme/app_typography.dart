import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTypography {
  static TextTheme get textTheme {
    return GoogleFonts.baloo2TextTheme().copyWith(
      displayLarge: GoogleFonts.baloo2(
        color: AppColors.textHeading,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      headlineMedium: GoogleFonts.baloo2(
        color: AppColors.textHeading,
        fontWeight: FontWeight.w700,
        fontSize: 24,
      ),
      titleLarge: GoogleFonts.baloo2(
        color: AppColors.textHeading,
        fontWeight: FontWeight.w600,
        fontSize: 20,
      ),
      bodyLarge: GoogleFonts.baloo2(
        color: AppColors.textBody,
        fontWeight: FontWeight.w400,
        fontSize: 16,
      ),
      bodyMedium: GoogleFonts.baloo2(
        color: AppColors.textBody,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      labelLarge: GoogleFonts.baloo2(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
    );
  }
}
