import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  static double paddingUnit = 16.0.sp;
  static double paddingUnitS = 8.0.sp;
  static double marginUnit = 16.0.sp;
  static double borderUnit = 32.0.sp;
  static double borderUnitS = 8.0.sp;

  static EdgeInsetsGeometry padding = EdgeInsets.all(paddingUnit);
  static EdgeInsetsGeometry paddingS = EdgeInsets.all(paddingUnitS);
  static EdgeInsetsGeometry paddingV = EdgeInsets.symmetric(vertical: 4.0.sp);
  static EdgeInsetsGeometry paddingH = EdgeInsets.symmetric(horizontal: 8.0.sp);
  static EdgeInsetsGeometry margin = EdgeInsets.all(marginUnit);
  static EdgeInsetsGeometry zero = EdgeInsets.zero;

  static BorderRadius borderRadius = BorderRadius.all(
    Radius.circular(borderUnit),
  );
  static BorderRadius borderRadiusS = BorderRadius.all(
    Radius.circular(borderUnitS),
  );

  static RoundedRectangleBorder roundBorder =
      RoundedRectangleBorder(borderRadius: borderRadius);
  static RoundedRectangleBorder roundBorderS =
      RoundedRectangleBorder(borderRadius: borderRadiusS);

  static SizedBox vSpacing = SizedBox(height: 16.0.h);
  static SizedBox vSpacingS = SizedBox(height: 4.0.h);
  static SizedBox hSpacing = SizedBox(width: 8.0.w);
  static SizedBox hSpacingS = SizedBox(height: 4.0.w);
}
