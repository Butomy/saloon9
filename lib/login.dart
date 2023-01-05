import 'package:flutter/material.dart';
import 'package:saloon9_login/costomeshape.dart';
import 'package:saloon9_login/home.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        top: true,
        child: SingleChildScrollView(scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: (Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [


              ClipPath(
                  clipper: CostumeShape(),
                  child: Container(
                    height: 280,
                    width: double.infinity,
                    color: Color(0xFF095D9F),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0, left: 30),
                      child: Text(
                        'SIGN IN',
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  )),

              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child:
                    Align(alignment: Alignment.topLeft, child: Text("Saloon ID")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  cursorHeight: 20,
                  decoration: InputDecoration(
                    isDense: true,contentPadding: EdgeInsets.only(bottom: 28,left: 20),
                    constraints: BoxConstraints(maxWidth: 300, maxHeight: 40),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, top: 20),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: Text("User ID/Mobile Number")),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,contentPadding: EdgeInsets.only(bottom: 28,left: 20),
                    constraints: BoxConstraints(maxWidth: 300, maxHeight: 40),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50.0, top: 15, bottom: 10),
                child:
                    Align(alignment: Alignment.topLeft, child: Text("Password")),
              ),
              TextField(
                obscureText:_obscureText,
                decoration: InputDecoration(isDense: true,contentPadding: EdgeInsets.only(bottom: 28,left: 20),
                  suffixIcon: GestureDetector(onTap: (){
                    setState(() {


                    _obscureText=!_obscureText;   });

                  },
                    child: Icon(_obscureText?Icons.visibility_off:Icons.visibility,size: 25,),
                  ),
                  constraints: BoxConstraints(maxWidth: 300, maxHeight: 40),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                  width: 300,
                  height: 45,
                  child: ElevatedButton(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("SIGN IN",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Color(0xFF095D9F)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    onPressed: () { Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeS9()),
                    );},
                  )),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Forgot Password? ",style: TextStyle(fontSize: 17),),
                  InkWell(
                    child: Text(
                      'Get OTP',
                      style: TextStyle(fontSize: 17,
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                    onTap: () {},
                  )
                ],
              )
            ],
          )),
        ),));


  }
}
