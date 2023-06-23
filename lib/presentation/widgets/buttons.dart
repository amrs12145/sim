import 'package:flutter/material.dart';
import 'package:sim/constants/dimensions.dart';
import '../../constants/colors.dart';

class AppPrimaryButton extends StatelessWidget {
  const AppPrimaryButton({
    super.key,
    required this.child,
    required this.onPressed,
    this.fixedSize,
  });

  final Widget child;
  final VoidCallback? onPressed;
  final Size? fixedSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        fixedSize: fixedSize,
        shape: AppDimensions.roundBorder,
      ),
      child: child,
    );
  }
}

class AppSecondaryButton extends StatelessWidget {
  const AppSecondaryButton({
    super.key,
    required this.child,
    this.onPressed,
  });

  final Widget child;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        foregroundColor: AppColors.primary,
      ),
      child: child,
    );
  }
}
