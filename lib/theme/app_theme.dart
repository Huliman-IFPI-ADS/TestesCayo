import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData theme = ThemeData(
    primaryColor: AppColors.orange,
    scaffoldBackgroundColor: AppColors.darkblue,
    appBarTheme: AppBarTheme(
      color: AppColors.orange,
      iconTheme: IconThemeData(
        color: AppColors.white,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.white,
      ),
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 22,
        fontFamily: 'Orbitron',
      ),
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(AppColors.orange),
        foregroundColor: MaterialStateProperty.all<Color>(AppColors.white),
        minimumSize: MaterialStateProperty.all<Size>(Size(120, 40)),
        textStyle: MaterialStateProperty.all<TextStyle>(
          TextStyle(
            fontSize: 22,
            fontFamily: 'Orbitron',
          ),
        ),
      ),
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(color: AppColors.white),
      bodyMedium: TextStyle(color: AppColors.white),
      bodySmall: TextStyle(color: AppColors.white),
      headlineLarge: TextStyle(color: AppColors.white),
      headlineMedium: TextStyle(color: AppColors.white),
      headlineSmall: TextStyle(color: AppColors.white),
    ),
  );
}
