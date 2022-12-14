import 'package:flutter/material.dart';

class MyDimensions {
  static const double paddingUnit = 16.0;
  static const double marginUnit = 16.0;
  static const double borderUnit = 16.0;

  static const EdgeInsetsGeometry paddingAll = EdgeInsets.all(paddingUnit);
  static const EdgeInsetsGeometry marginAll = EdgeInsets.all(marginUnit);
  static const BorderRadius borderAll = BorderRadius.all(
    Radius.circular(borderUnit),
  );

  static const RoundedRectangleBorder roundBorderAll =
      RoundedRectangleBorder(borderRadius: borderAll);

  static const SizedBox vSpacing = SizedBox(height: 16.0);
  static const SizedBox vSpacingS = SizedBox(height: 8.0);
  static const SizedBox hSpacing = SizedBox(height: 8.0);
  // static const SizedBox hSpacingS = SizedBox(height: 8.0);
}
