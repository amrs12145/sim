import 'package:flutter/material.dart';
import 'package:sim/app_nav.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/password_field.dart';
import 'package:sim/presentation/widgets/screen_divider.dart';
import 'package:sim/presentation/widgets/wave_background.dart';
import 'package:sim/routes.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      appBar: AppBar(),
      body: WaveBackground(
        firstColor: AppColors.primary,
        child: Padding(
          padding: AppDimensions.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your new\npassword'.capitalizeAllWord(),
                style: Theme.of(context).textTheme.headline1,
              ),
              const Spacer(),
              const AppPasswordField(),
              AppDimensions.vSpacing,
              const AppPasswordField(),
              AppDimensions.vSpacing,
              AppPrimaryButton(
                onPressed: () {},
                child: const Text('Reset password'),
              ),
              const AppScreenDivider(text: 'or'),
              AppSecondaryButton(
                onPressed: () {
                  AppNav.push(context, AppRoutes.login);
                },
                child: const Text('Cancel'),
              ),
              AppDimensions.vSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
