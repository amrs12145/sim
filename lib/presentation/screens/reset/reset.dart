import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/input_field.dart';
import 'package:sim/presentation/widgets/wave_background.dart';
import 'package:sim/routes.dart';

import '../../../core/validators.dart';

class ResetScreen extends StatelessWidget {
  const ResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.primary,
      appBar: AppBar(),
      body: WaveBackground(
        firstColor: AppColors.primary,
        child: Padding(
          padding: AppDimensions.paddingAll,
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Reset your \npassword'.capitalizeAllWord(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                AppDimensions.vSpacing,
                const Text(
                  'Enter the email address associated\nwith your account',
                ),
                const Spacer(),
                Text(
                  'Email address'.capitalizeAllWord(),
                  style: Theme.of(context).textTheme.headline2,
                ),
                AppDimensions.vSpacing,
                MyTextField(
                  hint: 'example@abc.com',
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: const Icon(Icons.check),
                  validator: AppValidators.validateEmail(),
                ),
                AppDimensions.vSpacing,
                AppPrimaryButton(
                  onPressed: () {
                    Get.to(MyRoutes.verificationScreen);
                  },
                  child: const Text('Send code'),
                ),
                AppDimensions.vSpacing,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Dont\'t have an account? ',
                      style: TextStyle(color: Colors.grey),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(MyRoutes.signUpScreen);
                      },
                      child: Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
                AppDimensions.vSpacing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
