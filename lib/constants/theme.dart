import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimensions.dart';

getMyThemeData() {
  return ThemeData(
    // primaryColor: MyColors.primary,
    colorScheme: const ColorScheme.light(
      primary: MyColors.primary,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      headline2: TextStyle(
        // color: Colors.grey,
        // fontWeight: FontWeight.bold,
        fontSize: 30,
      ),
      headline3: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: MyColors.primary,
      ),
      bodyText2: TextStyle(
        color: MyColors.onPrimary,
      ),
    ),
    appBarTheme: const AppBarTheme(elevation: 0),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: MyColors.primary,
        backgroundColor: MyColors.onPrimary,
        fixedSize: const Size(double.maxFinite, 48.0),
        shape: MyDimensions.roundBorderAll,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: MyColors.onPrimary,
        backgroundColor: MyColors.primary,
        fixedSize: const Size(double.maxFinite, 48.0),
        shape: MyDimensions.roundBorderAll,
      ),
    ),
  );
}
