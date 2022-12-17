import 'package:final_task/Screen/second_screen.dart';
import 'package:flutter/material.dart';
import 'package:custom_clippers/custom_clippers.dart';
class SixthPage extends StatefulWidget {
  const SixthPage({Key? key}) : super(key: key);

  @override
  State<SixthPage> createState() => _SixthPageState();
}

class _SixthPageState extends State<SixthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);

        }, icon: Icon(Icons.arrow_back_ios_new_rounded)),backgroundColor: Color.fromARGB(255, 31, 108, 238),),
      body:  Column(children: [

        ClipPath(
          clipper: SinCosineWaveClipper(),
          child: Container(
              height: 250,
              padding: EdgeInsets.fromLTRB(20, 90, 20, 90),
              color: Color.fromARGB(255, 31, 108, 238),
              alignment: Alignment.bottomLeft,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(

                      child: Text(
                          "Create",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white,)
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(

                      child: Text(
                          "Account",style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,color: Colors.white,)
                      ),
                    ),
                  ),
                ],
              )
            //style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,color: Colors.white,),


          ),
        ),
        SizedBox(height: 5,),
        TextField(
          decoration:
          InputDecoration(
              icon: Icon(Icons.person),
              labelText: "Student Name",



          )
          ,),
        SizedBox(height: 5,),
        TextField(
          decoration:
          InputDecoration(
              icon: Icon(Icons.perm_device_info),
              labelText: "Student ID",



          )
          ,),
        SizedBox(height: 5,),
        TextField(
          decoration:
          InputDecoration(
              icon: Icon(Icons.email_sharp),
              labelText: "Student Mail",



          )
          ,),
        SizedBox(height: 5,),
        TextField(
          decoration:
          InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "Password",
              suffixIcon: Icon(Icons.remove_red_eye)


          )
          ,),
        SizedBox(height: 5,),
        TextField(
          decoration:
          InputDecoration(
              icon: Icon(Icons.lock),
              labelText: "Student Password",
              suffixIcon: Icon(Icons.remove_red_eye)


          )
          ,),
        SizedBox(height: 5,),


        SizedBox(height: 10,),
        Container(
            height: 50,
            width: 390,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style:

              ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 31, 108, 238),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),


                ),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen(),));

              },
              child: Text('Login',style:TextStyle(color: Colors.white,fontSize: 18),) ,)
        ),
        SizedBox(height: 5,),
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
              style: TextStyle(color: Colors.black,fontSize: 16),
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
        SizedBox(height: 10,),
        Container(
            height: 50,
            width: 390,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: ElevatedButton(
              style:
              ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color.fromARGB(255, 31, 108, 238))


                ),),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => SixthPage(),));

              },
              child: Text('Sign Up',style:TextStyle(color: Colors.black,fontSize: 18),) ,)
        ),






      ]),
    );
  }
}
