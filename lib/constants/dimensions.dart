import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDimensions {
  static  double paddingUnit = 16.0.sp;
  static  double marginUnit = 16.0.sp;
  static  double borderUnit = 32.0.sp;
  static  double borderUnitS = 16.0.sp;

  static  EdgeInsetsGeometry paddingAll = EdgeInsets.all(paddingUnit);
  static  EdgeInsetsGeometry marginAll = EdgeInsets.all(marginUnit);
  static  BorderRadius borderRadius = BorderRadius.all(
    Radius.circular(borderUnit),
  );
  static  BorderRadius borderRadiusS = BorderRadius.all(
    Radius.circular(borderUnitS),
  );


  static  RoundedRectangleBorder roundBorderAll =
      RoundedRectangleBorder(borderRadius: borderRadius);

  static  SizedBox vSpacing = SizedBox(height: 16.0.h);
  static  SizedBox vSpacingS = SizedBox(height: 4.0.h);
  static  SizedBox hSpacing = SizedBox(width: 8.0.w);
   static  SizedBox hSpacingS = SizedBox(height: 4.0.w);
}
