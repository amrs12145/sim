import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/routes.dart';

import '../../widgets/otp_form.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.primary,
      appBar: AppBar(),
      body: Padding(
        padding: MyDimensions.paddingAll,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter verification \ncode'.capitalizeAllWord(),
              style: Theme.of(context).textTheme.headline1,
            ),
            MyDimensions.vSpacing,
            const Text('We \'ve sent  the verification code\nto your email.'),
            MyDimensions.vSpacing,
            const MyOTPForm(),
            const Spacer(),
            MyDimensions.vSpacing,
            ElevatedButton(
              onPressed: () {
                Get.to(MyRoutes.newPasswordScreen);
              },
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: MyColors.onPrimary),
                foregroundColor: MyColors.primary,
              ),
              child: const Text('Verify'),
            ),
            MyDimensions.vSpacing,
            Center(
              child: TextButton(
                onPressed: () {},
                // TODO: To add countdown timer widget
                child: const Text('Resend code after 1:33'),
              ),
            ),
            MyDimensions.vSpacing,
            Center(
              child: Text(
                'Did not receive emails? Check your spam filters,',
                style: TextStyle(color: Colors.grey.shade300),
              ),
            ),
            Center(
              child: InkWell(
                onTap: () {
                  Get.back();
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
            MyDimensions.vSpacing,
          ],
        ),
      ),
    );
  }
}
