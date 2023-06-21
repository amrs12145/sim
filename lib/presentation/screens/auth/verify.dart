import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/routes.dart';

import '../../../app_nav.dart';
import '../../widgets/buttons.dart';
import '../../widgets/otp_form.dart';
import '../../widgets/timer.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Padding(
        padding: AppDimensions.padding,
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/images/login-logo.png',
                width: MediaQuery.of(context).size.width * .5,
                height: MediaQuery.of(context).size.height * .2,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              'Enter verification \ncode'.capitalizeAllWord(),
              style: Theme.of(context).textTheme.displayLarge,
              textAlign: TextAlign.center,
            ),
            AppDimensions.vSpacingS,
            Text(
              'We \'ve sent  the verification code\nto your email.',
              style: textTheme.titleSmall,
              textAlign: TextAlign.center,
            ),
            AppDimensions.vSpacing,
            const AppOTPForm(),
            const Spacer(),
            AppDimensions.vSpacing,
            AppPrimaryButton(
              onPressed: () {
                AppNav.pushReplacement(
                  context,
                  AppRoutes.resetPassword,
                );
              },
              child: const Text('Verify'),
              fixedSize: Size(153.0.w, 48.0.h),
            ),
            AppDimensions.vSpacing,
            ResendCodeButton(),
            AppDimensions.vSpacing,
            Center(
              child: Text(
                'Did not receive emails? Check your spam filters,',
                style: TextStyle(color: Colors.grey.shade300),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  AppNav.pop(context);
                },
                child: Text(
                  'or Try another email address',
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.lightBlueAccent),
                ),
              ),
            ),
            AppDimensions.vSpacing,
          ],
        ),
      ),
    );
  }
}
