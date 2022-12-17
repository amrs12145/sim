import 'package:final_task/Screen/second_screen.dart';
import 'package:flutter/material.dart';

import '../shared/default_btn.dart';
import 'sixth_screen.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 31, 108, 238),
        elevation: 0,
      ),
      body: Container(
        color: Color.fromARGB(255, 31, 108, 238),
        child: Column(
          children: [
            Image.asset('images/sim.jpg',
                width: MediaQuery.of(context).size.width * 0.90),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 2),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                      'dataLorem ipsum dolor sit\namet, consectetur\nadipiscing elit ',
                      style: TextStyle(fontSize: 25, color: Colors.white))),
            ),
            SizedBox(
              height: 35,
            ),
            Default_Button(
                context: context,
                name: "Login",
                borderColor: Colors.transparent,
                onClick: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SecondScreen(),
                      ));
                }),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    indent: 20.0,
                    endIndent: 10.0,
                    thickness: 1,
                  ),
                ),
                Text(
                  "or",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                Expanded(
                  child: Divider(
                    color: Colors.white,
                    indent: 10.0,
                    endIndent: 20.0,
                    thickness: 1,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Default_Button(
                context: context,
                name: "Sign up",
                borderColor: Colors.transparent,
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SixthPage()));
                })
          ],
        ),
      ),
    );
  }

}
