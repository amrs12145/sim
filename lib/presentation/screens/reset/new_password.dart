import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sim/constants/colors.dart';
import 'package:sim/constants/dimensions.dart';
import 'package:sim/core/extensions.dart';
import 'package:sim/presentation/widgets/buttons.dart';
import 'package:sim/presentation/widgets/password_field.dart';
import 'package:sim/presentation/widgets/screen_divider.dart';
import 'package:sim/presentation/widgets/wave_background.dart';
import 'package:sim/routes.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Enter your new\npassword'.capitalizeAllWord(),
                style: Theme.of(context).textTheme.headline1,
              ),
              const Spacer(),
              const PasswordField(),
              MyDimensions.vSpacing,
              const PasswordField(),
              MyDimensions.vSpacing,
              MyButtons.primary(
                onPressed: () {},
                child: const Text('Reset password'),
              ),
              const MyScreenDivider(text: 'or'),
              MyButtons.secondary(
                onPressed: () {
                  Get.to(MyRoutes.loginScreen);
                },
                child: const Text('Cancel'),
              ),
              MyDimensions.vSpacing,
            ],
          ),
        ),
      ),
    );
  }
}
