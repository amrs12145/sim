import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sim/buisness_logic/validators.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/password_field.dart';
import 'package:sim/routes.dart';
import '../../constants/dimensions.dart';

import '../../constants/colors.dart';
import '../widgets/input_field.dart';
import '../widgets/screen_divider.dart';
import '../widgets/wave_background.dart';

class SignUpScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: MyColors.primary,
      appBar: AppBar(),
      body: WaveBackground(
        firstColor: MyColors.primary,
        child: Padding(
          padding: MyDimensions.paddingAll,
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create \naccount!'.capitalizeAllWord(),
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                const MyTextField(
                  hint: 'Student Name',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                MyDimensions.vSpacing,
                const MyTextField(
                  hint: 'Student ID',
                  prefixIcon: Icon(Icons.person_outline),
                ),
                MyDimensions.vSpacing,
                MyTextField(
                  hint: 'Student Mail',
                  prefixIcon: const Icon(Icons.person_outline),
                  validator: MyValidators.validateEmail(),
                ),
                MyDimensions.vSpacing,
                const PasswordField(),
                MyDimensions.vSpacing,
                const PasswordField(),
                MyDimensions.vSpacing,
                MyButtons.primary(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(MyRoutes.homeScreen);
                      // Get.to(() => MyRoutes.homeScreen);
                    }
                  },
                  child: const Text('Sign Up'),
                ),
                const MyScreenDivider(text: 'or'),
                MyButtons.secondary(
                  onPressed: () {
                    Get.to(MyRoutes.loginScreen);
                    // Get.to(() => MyRoutes.loginScreen);
                  },
                  child: const Text('Log in'),
                ),
                MyDimensions.vSpacing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
