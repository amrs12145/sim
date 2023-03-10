import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';

getMyThemeData() {
  return ThemeData(
    // primaryColor: MyColors.primary,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primary,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 30,
        //madetommy
      ),
      headline2: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 30,
      ),
      subtitle1: TextStyle(
        color: Color(0xff3B8DFE),
        fontSize: 17,
      ),
      subtitle2: TextStyle(
        color: Colors.grey,
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

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.onPrimary,
        backgroundColor: AppColors.primary,
        fixedSize: const Size(double.maxFinite, 48.0),
        shape: AppDimensions.roundBorderAll,
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
      fillColor: Colors.black,
    ),
  );
}
