//import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';
//import 'package:flutter_facebook_login/flutter_facebook_login.dart';
//import 'SignUpPage.dart';
//import 'package:http/http.dart' as http;

//import 'SinInPage.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage>
    with TickerProviderStateMixin {
   AnimationController _controller1;
   Animation<Offset> animation1;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
    animation1 = Tween<Offset>(
      begin: Offset(0.0, 8.0),
      end: Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.bounceIn),
    );
    _controller1.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
    //_controller2.dispose();
  }

  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue, Colors.black])),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
       /* decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.blue],
            begin: const FractionalOffset(0.0, 1.0),
            end: const FractionalOffset(0.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.repeated,
          ),
        ),*/
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
          child: Column(
            children: [
              Text("Remote Billiard",
                  style: GoogleFonts.bowlbyOneSc(
                    fontSize: 40,
                    color: Colors.white,
                  )),
              SizedBox(
                height: MediaQuery.of(context).size.height / 22,
              ),
              SlideTransition(
                position: animation1,
                child: Image.asset(
                  "./assets/logo.png",
                  height: 100,
                  width: 100,
                ),
              ),
              Text("Experince the Excitement of live game ",
                  style: GoogleFonts.alikeAngular(
                    fontSize: 13,
                    color: Colors.white,
                  )),
              SizedBox(
                height: 20,
              ),
              boxContainer(
                  "email.png", "Sign Up With Email", onEmailClick),
              SizedBox(
                height: 20,
              ),
              boxContainer(
                  "facebook.png", "Sign Up With Facebook", null),
              SizedBox(
                height: 20,
              ),
              boxContainer("google.png", "Sign Up With Google", null),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Sign In",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ),
    );
  }

  onEmailClick() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => SignUp(),
    ));
  }

  Widget boxContainer(String path, String text, onClick) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 140,
      child: InkWell(
        onTap: onClick,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Image.asset(
                  path,
                  height: 25,
                  width: 25,
                ),
                SizedBox(width: 20),
                Text(
                  text,
                  style: TextStyle(fontSize: 16, color: Colors.black),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
