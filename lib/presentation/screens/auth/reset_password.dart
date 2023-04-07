import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../app_router.dart';
import '../../../constants/dimensions.dart';
import '../../../routes.dart';
import '../../widgets/buttons.dart';
import '../../widgets/input_field.dart';
import '../../widgets/password_field.dart';
class ResetPasswordScreen extends StatelessWidget {
  final formResetKey = GlobalKey<FormState>();

   ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: AppDimensions.paddingAll,
        child: Form(
          key: formResetKey,
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
                  'Reset Password',
                  style: textTheme.displayLarge,
                ),
                AppDimensions.vSpacing,
                const AppPasswordField(),
                AppDimensions.vSpacingS,
                AppPasswordField(hint: "Confirm Password"),
                AppDimensions.vSpacing,
                AppPrimaryButton(
                  onPressed: () {
                    if (formResetKey.currentState!.validate()) {
                      AppRouter.goTo(context, MyRoutes.landingScreen);
                    }
                  },
                  fixedSize:  Size(153.0.w, 48.0.h),
                  child: const Text('Reset'),
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
