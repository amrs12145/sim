import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';

getMyThemeData() {
  return ThemeData(
    // primaryColor: MyColors.primary,
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        //madetommy
      ),
      headline2: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 22,
      ),
      headline3: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 17,
      ),
      subtitle1: TextStyle(
        color: AppColors.white,
        fontSize: 22,
      ),
      subtitle2: TextStyle(
        color: AppColors.grey,
        fontSize: 14,
      ),
      bodyText1: TextStyle(
        color: AppColors.primary,
      ),
      bodyText2: TextStyle(),
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      foregroundColor: Colors.black,
      backgroundColor: Colors.transparent,
      toolbarHeight: 30.0,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.onPrimary,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.onPrimary,
        backgroundColor: AppColors.primary,
        fixedSize: const Size(double.maxFinite, 48.0),
        shape: AppDimensions.roundBorder,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: AppDimensions.roundBorderS,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        padding: EdgeInsets.zero,
        // backgroundColor: AppColors.primary,
        // fixedSize: const Size(double.maxFinite, 48.0),
        // shape: AppDimensions.roundBorderAll,
      ),
    ),

    inputDecorationTheme: const InputDecorationTheme(
      prefixStyle: TextStyle(),
      fillColor: AppColors.black,
    ),
  );
}
