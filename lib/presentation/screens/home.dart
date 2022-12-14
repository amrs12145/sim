import 'package:flutter/material.dart';

import '../widgets/screenDivider.dart';
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
            Image.asset(
              'assets/images/sim_logo.png',
            ),
            MyDimensions.vSpacing,
            Text('Welcome Sim'),
            MyDimensions.vSpacing,
            ElevatedButton(
              onPressed: () {},
              child: Text('login'),
            ),
            MyDimensions.vSpacingS,
            MyScreenDivider(text: 'or'),
            MyDimensions.vSpacingS,
            ElevatedButton(
              onPressed: () {},
              child: Text('sign up'),
            ),
          ],
        ),
      ),
    );
  }
}
