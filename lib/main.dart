import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sim/routes.dart';

import 'constants/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getMyThemeData(),
      home: MyRoutes.homeScreen,
    );
  }
}
