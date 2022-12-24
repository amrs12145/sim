import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim/routes.dart';

import '../widgets/screen_divider.dart';
import '../../constants/colors.dart';
import '../../constants/dimensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primary,
      body: Padding(
        padding: MyDimensions.paddingAll,
        child: Column(
          children: [
            MyDimensions.vSpacing,
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset(
                'assets/images/sim_logo.png',
                width: MediaQuery.of(context).size.width * 0.60,
              ),
            ),
            MyDimensions.vSpacing,
            Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome to SIM',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text('Software Industry and Multimedia Systems'),
            ),
            const Spacer(),
            MyDimensions.vSpacing,
            ElevatedButton(
              onPressed: () {
                Get.to(() => MyRoutes.loginScreen);
              },
              child: const Text('login'),
            ),
            const MyScreenDivider(text: 'or'),
            ElevatedButton(
              onPressed: () {
                Get.to(() => MyRoutes.signUpScreen);
              },
              child: const Text('sign up'),
            ),
            MyDimensions.vSpacing,
          ],
        ),
      ),
    );
  }
}
