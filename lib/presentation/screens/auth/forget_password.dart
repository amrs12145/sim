import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:sim/app_router.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/input_field.dart';
import 'package:sim/presentation/widgets/wave_background.dart';
import 'package:sim/routes.dart';

import '../../../core/validators.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: AppDimensions.paddingAll,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/images/login_logo.png',
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .2,
                  fit: BoxFit.contain,
                ),
              ),
              Text(
                'Forgot Password?!',
                style: textTheme.headline1,
              ),
              AppDimensions.vSpacing,
              Text(
                'Enter the email address\nassociated with your account\nand we will send you instructions\nto reset your password',
                style: textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              AppDimensions.vSpacing,
              MyTextField(
                hint: 'Email Address',
                prefixIcon: const Icon(Icons.mail_outlined),
                validator: AppValidators.validateEmail(),
              ),
              AppDimensions.vSpacing,

              AppPrimaryButton(
                onPressed: () {
                  AppRouter.goTo(context, MyRoutes.verificationScreen);
                },
                child: const Text('Send Code'),
                fixedSize:  Size(153.0.w, 48.0.h),

              ),

            ],
          ),
        ),
      ),
    );
  }
}
