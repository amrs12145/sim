import 'package:flutter/material.dart';

import 'dimensions.dart';

getMyThemeData() {
  return ThemeData(
    textTheme: TextTheme(
      bodyText2: TextStyle(
        color: Colors.white,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        onPrimary: Colors.white,
        fixedSize: Size(double.maxFinite, 55.0),
        shape: MyDimensions.roundBorderAll,
      ),
    ),
  );
}
