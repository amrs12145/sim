import 'package:final_task/Screen/fourth_page.dart';
import 'package:final_task/main.dart';
import 'package:final_task/Screen/sixth_screen.dart';
import 'package:final_task/Screen/third_screen.dart';
import 'package:final_task/shared/constants.dart';
import 'package:final_task/shared/default_btn.dart';
import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        ClipPath(
          clipper: SinCosineWaveClipper(),
          child: Container(
              height: 250,
              padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
              color: Color.fromARGB(255, 31, 108, 238),
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Text("Welcome\nBack!",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        )),
                  ),
                ],
              )
            //style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white,),

          ),
        ),
        SizedBox(
          height: 50,
        ),
        TextField(
          controller: TextEditingController(text: "example123@abc.com"),
          decoration: InputDecoration(
              icon: Icon(Icons.email_outlined),
              labelText: "E-mail",
              suffixIcon: Icon(Icons.check)),
        ),
        SizedBox(
          height: 10,
        ),
        TextField(
          decoration: InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "Password",
              suffixIcon: Icon(Icons.remove_red_eye)),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(0),
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              child: TextButton(
                child: Text('Forgot Password?', style: TextStyle(fontSize: 15)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ThirdScreen(),
                      ));
                },
              ),
            ),
          ),
        ),
        SizedBox(
          height: 90,
        ),
        Default_Button(context: context,
            borderColor: Colors.transparent,
            name: 'Login',
            backgroundColor: MyColors.myBlue,
            txtColor: Colors.white,
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
                color: Colors.black,
                indent: 20.0,
                endIndent: 10.0,
                thickness: 1,
              ),
            ),
            Text(
              "or",
              style: TextStyle(color: Colors.black, fontSize: 16),
            ),
            Expanded(
              child: Divider(
                color: Colors.black,
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
            borderColor: Color.fromARGB(255, 31, 108, 238),
            name: 'Sign up',
            onClick: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SixthPage(),
                  ));
            }),
      ]),
    );
  }
}
