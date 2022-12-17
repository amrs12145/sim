import 'package:final_task/Screen/fourth_page.dart';
import 'package:final_task/Screen/sixth_screen.dart';
import 'package:flutter/material.dart';

class FifthScreen extends StatefulWidget {
  const FifthScreen({Key? key}) : super(key: key);

  @override
  State<FifthScreen> createState() => _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: Color.fromARGB(255, 31, 108, 238),
      ),
      body: Container(
        color: Color.fromARGB(255, 31, 108, 238),
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: 16,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      child: Text('Enter Verification\ncode',
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)))),

              SizedBox(
                height: 16,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      child: Text('we\'ve sent you the verification  ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )))),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      child: Text('code to your email . ',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          )))),
              SizedBox(
                height: 16,
              ),
              Form(
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 68,
                        width: 64,
                        child: const DecoratedBox(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '1',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 68,
                        width: 64,
                        child: const DecoratedBox(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '2',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 68,
                        width: 64,
                        child: const DecoratedBox(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '3',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 68,
                        width: 64,
                        child: const DecoratedBox(
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '4',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 30),
                            ),
                          ),
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Container(
                  height: 50,
                  width: 390,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FourthPage(),
                          ));
                    },
                    child: Text(
                      'Verify',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
