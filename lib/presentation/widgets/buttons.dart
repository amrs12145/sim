import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../screens/login.dart';

class MyButtons {
  static Widget primary({required Widget child, VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.primary,
        foregroundColor: MyColors.onPrimary,
      ),
      child: child,
    );
  }

  static Widget secondary({required Widget child, VoidCallback? onPressed}) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        side: const BorderSide(color: MyColors.primary),
        foregroundColor: MyColors.primary,
      ),
      child: child,
    );
  }
}
