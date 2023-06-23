import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/routes.dart';

import '../../../app_nav.dart';
import '../../widgets/screen_divider.dart';
import '../../../constants/dimensions.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Padding(
        padding: AppDimensions.padding,
        child: Column(
          children: [
            const SizedBox(height: 64.0),
            Image.asset(
              'assets/images/simplify-logo.png',
              width: MediaQuery.of(context).size.width * .5,
              height: 200.h,
              fit: BoxFit.contain,
            ),
            Text(
              'Simplify Your Career',
              style: textTheme.titleMedium,
            ),
            const Spacer(),
            AppPrimaryButton(
              onPressed: () {
                AppNav.push(context, AppRoutes.login);
              },
              child: const Text('Login'),
            ),
            const AppScreenDivider(text: 'or'),
            AppPrimaryButton(
              onPressed: () {
                AppNav.push(context, AppRoutes.signUp);
              },
              child: const Text('Sign Up'),
            ),
            AppDimensions.vSpacing,
          ],
        ),
      ),
    );
  }
}
