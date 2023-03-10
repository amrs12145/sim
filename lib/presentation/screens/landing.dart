import 'package:flutter/material.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/routes.dart';

import '../../app_router.dart';
import '../widgets/screen_divider.dart';
import '../../constants/colors.dart';
import '../../constants/dimensions.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      // backgroundColor: MyColors.primary,
      body: Padding(
        padding: AppDimensions.paddingAll,
        child: Column(
          children: [
            const SizedBox(height: 64.0),
            Image.asset(
              'assets/images/simplify_logo.png',
              width: MediaQuery.of(context).size.width * .5,
              height: 200,
              fit: BoxFit.contain,
            ),
            Text(
              'Simplify Your Career',
              style: textTheme.subtitle1,
            ),
            const Spacer(),
            AppPrimaryButton(
              onPressed: () {
                AppRouter.goTo(context, MyRoutes.loginScreen);
              },
              child: const Text('Login'),
            ),
            const MyScreenDivider(text: 'or'),
            AppPrimaryButton(
              onPressed: () {
                AppRouter.goTo(context, MyRoutes.signUpScreen);
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
