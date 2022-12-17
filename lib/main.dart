import 'package:final_task/Screen/fourth_page.dart';
import 'package:final_task/Screen/second_screen.dart';
import 'package:final_task/Screen/sixth_screen.dart';
import 'package:flutter/material.dart';

import 'Screen/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
    );
  }
}

//  ButtonStyle(backgroundColor:
//                    MaterialStatePropertyAll(Colors.white),
