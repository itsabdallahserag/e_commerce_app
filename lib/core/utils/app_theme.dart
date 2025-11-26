import 'package:e_commerce_app/core/utils/app_colors.dart';
import 'package:e_commerce_app/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class AppTheme{
static final ThemeData lightTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.white,
  canvasColor: AppColors.primary,
  hoverColor: AppColors.white,
  textTheme: TextTheme(
    headlineSmall: AppStyles.regular12primary,
    displayLarge: AppStyles.semiBold24Primary,
    bodyLarge: AppStyles.semiBold20White,
    headlineLarge: AppStyles.semiBold20Primary,
    bodyMedium: AppStyles.light18Primary,
    bodySmall: AppStyles.light18White,
    displayMedium: AppStyles.medium18primary,
    displaySmall: AppStyles.regular18primary
  )
);
static final ThemeData darkTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.primaryDark,
    hoverColor: AppColors.primary,
    canvasColor: AppColors.white,
    textTheme: TextTheme(
        headlineSmall: AppStyles.regular12white,
        headlineLarge: AppStyles.semiBold20White,
        displayLarge: AppStyles.semiBold24White,
        bodyLarge: AppStyles.semiBold20Primary,
        bodyMedium: AppStyles.light18White,
        bodySmall: AppStyles.light18Black,
        displayMedium: AppStyles.medium18white,
        displaySmall: AppStyles.regular18white
    )
);
}