import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim/buisness_logic/validators.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/password_field.dart';
import 'package:sim/routes.dart';
import '../../constants/dimensions.dart';

import '../../constants/colors.dart';
import '../widgets/input_field.dart';
import '../widgets/screen_divider.dart';
import '../widgets/wave_background.dart';

class LoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  LoginScreen({super.key});

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
                  'Welcome \nBack!',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const Spacer(),
                MyTextField(
                  hint: 'example@abc.com',
                  prefixIcon: const Icon(Icons.email),
                  suffixIcon: const Icon(Icons.check),
                  validator: MyValidators.validateEmail(),
                ),
                MyDimensions.vSpacing,
                const PasswordField(),
                MyDimensions.vSpacing,
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Get.to(MyRoutes.resetScreen);
                    },
                    child: Text(
                      'Forget password',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
                MyDimensions.vSpacing,
                MyButtons.primary(
                  child: const Text('Login'),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Get.to(MyRoutes.homeScreen);
                      // Get.to(() => MyRoutes.homeScreen);
                    }
                  },
                ),
                const MyScreenDivider(text: 'or'),
                MyButtons.secondary(
                  child: const Text('Sign up'),
                  onPressed: () {
                    Get.to(MyRoutes.signUpScreen);
                    // Get.to(() => MyRoutes.signUpScreen);
                  },
                ),
                // Very important when using Column.
                MyDimensions.vSpacing,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
