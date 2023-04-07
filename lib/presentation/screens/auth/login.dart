import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sim/app_router.dart';
import 'package:sim/core/validators.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/password_field.dart';
import 'package:sim/routes.dart';
import '../../../constants/dimensions.dart';

import '../../widgets/input_field.dart';

class LoginScreen extends StatelessWidget {
  final formLoginKey = GlobalKey<FormState>();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppDimensions.paddingAll,
        child: Form(
          key: formLoginKey,
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
                  'Welcome back!',
                  style: textTheme.headline1,
                ),
                AppDimensions.vSpacingS,
                Text(
                  'login to your existing account',
                  style: textTheme.subtitle2,
                ),
                AppDimensions.vSpacing,
                MyTextField(
                  hint: 'Username',
                  prefixIcon: const Icon(Icons.account_box),
                  suffixIcon: const Icon(Icons.check),
                  validator: AppValidators.validateEmail(),
                ),
                AppDimensions.vSpacing,
                const AppPasswordField(),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: TextButton(
                    onPressed: () {
                      AppRouter.goTo(context, MyRoutes.forgetPasswordScreen);
                    },
                    child: const Text('Forgot Password?'),
                  ),
                ),
                AppDimensions.vSpacing,
                AppPrimaryButton(
                  onPressed: () {
                    if (formLoginKey.currentState!.validate()) {
                      AppRouter.goTo(context, MyRoutes.landingScreen);
                    }
                  },
                  fixedSize:  Size(153.0.w, 48.0.h),
                  child: const Text('Log in'),
                ),
                AppDimensions.vSpacing,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Don\'t have an account?'),
                    TextButton(
                      onPressed: () {
                        AppRouter.goTo(context, MyRoutes.signUpScreen);
                      },
                      child: const Text('Sign up'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
