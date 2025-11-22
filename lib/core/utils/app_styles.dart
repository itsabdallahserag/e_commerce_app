import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
class AppStyles {

  static final TextStyle semiBold26white = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 26,
    fontWeight: FontWeight.w600,
  );

  static final TextStyle light16white = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle medium18white = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );

  static final TextStyle light18Black = GoogleFonts.poppins(
    color: AppColors.black,
    fontSize: 18,
    fontWeight: FontWeight.w300,
  );

  static final TextStyle regular18white = GoogleFonts.poppins(
    color: AppColors.white,
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );

  static final TextStyle semiBold20PrimaryDark = GoogleFonts.poppins(
    color: AppColors.primaryDark,
    fontSize: 20,
    fontWeight: FontWeight.w600,);
}
