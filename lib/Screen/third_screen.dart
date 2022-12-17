import 'package:final_task/Screen/fifth_screen.dart';
import 'package:final_task/Screen/fourth_page.dart';
import 'package:final_task/Screen/sixth_screen.dart';
import 'package:flutter/material.dart';
class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Navigator.pop(context);

        }, icon: Icon(Icons.arrow_back_ios_new_rounded)),backgroundColor: Color.fromARGB(255, 31, 108, 238),),
      body: Container(
        color: Color.fromARGB(255, 31, 108, 238),
        width: double.infinity,
        height: double.infinity,

        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(

            children: [
              SizedBox(height: 32,),

              Align
                (
                  alignment: Alignment.topLeft,
                  child: Container(child: Text('Reset Your ',style: TextStyle(
                    fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold)))),
              Align
                (
                  alignment: Alignment.topLeft,
                  child: Container(child: Text('Password ',style: TextStyle(
                      fontSize: 32,color: Colors.white,fontWeight: FontWeight.bold)))),
              SizedBox(height: 16,),
              Align
                (
                  alignment: Alignment.topLeft,
                  child: Container(child: Text('Enter the email adress ',style: TextStyle(
                      fontSize: 20,color: Colors.white,)))),
              Align
                (
                  alignment: Alignment.topLeft,
                  child: Container(child: Text('associated with your account ',style: TextStyle(
                    fontSize: 20,color: Colors.white,)))),
              Align
                (
                  alignment: Alignment.topLeft,
                  child: Container(child: Text('and we will send you instructions ',style: TextStyle(
                    fontSize: 20,color: Colors.white,)))),
              Align
                (
                  alignment: Alignment.topLeft,
                  child: Container(child: Text('to reset your password',style: TextStyle(
                    fontSize: 20,color: Colors.white,)))),
              SizedBox(height: 70,),
              Align
                (
                  alignment: Alignment.topLeft,
                  child: Container(child: Text('Email Address',style: TextStyle(
                    fontSize: 24,color: Colors.black,)))),
              SizedBox(height: 6,),
              Row(
                children: [

                  Icon(Icons.email_outlined),
                  SizedBox(width: 10,),
                  Text("example123@abc.com",style: TextStyle(color: Colors.black45),)
                  
                ],
                
              ),
              SizedBox(height: 70,),
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


                      ),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => FifthScreen(),));
                    },
                    child: Text('Send instructions',style:TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),) ,)
              ),
              SizedBox(height: 10,),
              Divider(
                thickness: 2,
                color: Colors.black12,
                indent: 12,
                endIndent: 12,
              ),
              SizedBox(height: 32,),
              Align
                (
                  alignment: Alignment.center,
                  child: Container(child: Text('Login',style: TextStyle(
                    fontSize: 24,color: Colors.black,)))),
              SizedBox(height: 32,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: Divider(
                      color: Colors.black12,
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
                      color: Colors.black12,
                      indent: 10.0,
                      endIndent: 20.0,
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 32,),
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


                      ),),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SixthPage(),));
                    },
                    child: Text('Sign Up',style:TextStyle(color: Colors.black,fontSize: 18),) ,)
              ),






            ],
          ),
        ),
      ),




    );
  }
}
