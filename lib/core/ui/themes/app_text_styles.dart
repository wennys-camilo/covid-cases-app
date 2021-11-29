import 'app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final ufText = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static final mediumText = GoogleFonts.poppins(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    color: AppColors.black,
  );

  static final greyText = GoogleFonts.poppins(
    fontSize: 14,
    color: AppColors.grey,
  );

  static final munText = GoogleFonts.mcLaren(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.black,
      fontStyle: FontStyle.italic);

  static final loginTitle = GoogleFonts.aBeeZee(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: AppColors.blue,
      fontStyle: FontStyle.normal);

  static final stateText = GoogleFonts.mcLaren(
      fontSize: 14,
      fontWeight: FontWeight.bold,
      color: AppColors.red,
      fontStyle: FontStyle.italic);

  static final textButtonBluekUnderline = GoogleFonts.poppins(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.blue,
    decoration: TextDecoration.underline,
  );
}
