import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sim/core/validators.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/password_field.dart';
import 'package:sim/routes.dart';
import '../../app_router.dart';
import '../../constants/dimensions.dart';

import '../../constants/colors.dart';
import '../widgets/input_field.dart';
import '../widgets/screen_divider.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppDimensions.paddingAll,
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/login_logo.png',
                  width: MediaQuery.of(context).size.width * .5,
                  height: MediaQuery.of(context).size.height * .2,
                  fit: BoxFit.contain,
                ),
                Text(
                  'Let\'s Get Started!'.capitalizeAllWord(),
                  style: textTheme.headline1,
                ),
                AppDimensions.vSpacingS,
                Text(
                  'Create your new account',
                  style: textTheme.subtitle2,
                ),
                AppDimensions.vSpacing,
                const MyTextField(
                  hint: 'Username',
                  prefixIcon: Icon(Icons.account_box),
                  suffixIcon: Icon(Icons.check),
                ),
                AppDimensions.vSpacing,
                const MyTextField(
                  hint: 'Student ID',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                AppDimensions.vSpacing,
                MyTextField(
                  hint: 'Student Mail',
                  prefixIcon: const Icon(Icons.person_outline),
                  validator: AppValidators.validateEmail(),
                ),
                AppDimensions.vSpacing,
                const AppPasswordField(),
                AppDimensions.vSpacing,
                const AppPasswordField(hint: 'Confirm Password'),
                AppDimensions.vSpacing,
                AppPrimaryButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(MyRoutes.homeScreen);
                      // Get.to(() => MyRoutes.homeScreen);
                    }
                  },
                  child: const Text('Sign Up'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?'),
                    TextButton(
                      onPressed: () {
                        AppRouter.goTo(context, MyRoutes.loginScreen);
                      },
                      child: const Text('Log in'),
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
