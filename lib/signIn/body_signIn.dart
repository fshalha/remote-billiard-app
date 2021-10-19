import 'package:google_fonts/google_fonts.dart';
import 'package:remote_billiard/backEnd_conn/game_communication.dart';
import 'package:remote_billiard/buttons_login-signIn-forgotPassword/confirm_password_field.dart';
import 'package:remote_billiard/buttons_login-signIn-forgotPassword/rounded_button.dart';
import 'package:remote_billiard/buttons_login-signIn-forgotPassword/rounded_input_field.dart';
import 'package:remote_billiard/buttons_login-signIn-forgotPassword/rounded_password_field.dart';
import 'package:remote_billiard/loginScreen.dart';
import 'package:remote_billiard/signIn/sign_in_validate.dart';
import 'package:flutter/material.dart';

class BodySignIn extends StatefulWidget {
  const BodySignIn({
    Key key,
  }) : super(key: key);

  @override
  _BodySignInState createState() => _BodySignInState();
}

class _BodySignInState extends State<BodySignIn> {
  static String email, username, password_1, password_2, dateofbirth;
  static List msgs = [
    " Invalid Username",
    "Invalid Email",
    "Invalid Date",
    "Invalid Password",
    "Re-Enter the Password"
  ];
  static int isValid;
  String passwordError = "";
  List<String> dataMsg = <String>[];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
       decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey[900],Colors.blue[900]])),
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
               Container(
                child:Image.asset(
                  "assets/logo.png",
                  height: 75,
                  width: 125,
                )),
                Text(
              "Remote Billiard",
              style:GoogleFonts.lobster(
              textStyle:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 5,
                color: Colors.blue[200],
              ),
              ),
            ),
            SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                   margin: EdgeInsets.only(left:40),
                  alignment:Alignment.topLeft,
                child: Text(
                  "Signin",
                  style:GoogleFonts.openSans(
                    textStyle:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blue[200],
                    letterSpacing: 5,
                    
                  ),
                  ),
                ),
                ),
              SizedBox(
                height: size.height * 0.01,
              ),
              RoudedInputField(
                hintText: "Username",
                onChanged: (value) {
                  username = value;
                },
                icon: Icons.person,
              ),
              RoudedInputField(
                hintText: "Email",
                onChanged: (value) {
                  email = value;
                },
                icon: Icons.email,
              ),
            
              RoundedPasswordField(
                onChanged: (value) {
                  password_1 = value;
                },
                text: "Password",
              ),
              ConfirmPasswordField(
                onChanged: (value) {
                  password_2 = value;
                },
                text: "Confirm Password",
              ),
              Text(
                passwordError,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                  color: Colors.red,
                ),
              ),
              RoundedButton(
                text: "Create Account",
                color: Colors.amber,
                press: () {

                  isValid = validate_sign_in(
                      username, email, dateofbirth, password_1, password_2);
                  if (isValid == 100) {
                    if (password_1.compareTo(password_2) != 0) {
                      changeText();
                      return;
                    } else {
                      dataMsg = [username, email, password_1, dateofbirth];
                      game.send('SIGNUP', dataMsg.join(":"));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    }
                  } else {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: new Text(
                              msgs[isValid],
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            backgroundColor: Colors.lightBlue[900],
                            actions: <Widget>[
                              new FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: new Text(
                                    "ok",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ))
                            ],
                          );
                        });
                  }
                },
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
            ],
          ),
        ),
      ),
    );
  }

  changeText() {
    setState(() {
      passwordError = "Password didn't matched!!!";
    });
  }
}
