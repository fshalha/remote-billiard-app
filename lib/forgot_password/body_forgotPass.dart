import 'package:google_fonts/google_fonts.dart';
import 'package:remote_billiard/buttons_login-signIn-forgotPassword/confirm_password_field.dart';
import 'package:remote_billiard/buttons_login-signIn-forgotPassword/rounded_button.dart';
import 'package:remote_billiard/buttons_login-signIn-forgotPassword/rounded_input_field.dart';
import 'package:remote_billiard/buttons_login-signIn-forgotPassword/rounded_password_field.dart';
import 'package:remote_billiard/loginScreen.dart';
import 'package:flutter/material.dart';

// forgot password screen

class BodyForgotPass extends StatelessWidget {
  const BodyForgotPass({
    Key key,
  }) : super(key: key);

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
                  "Reset Password",
                  style:GoogleFonts.openSans(
                    textStyle:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.blue[200],
                    letterSpacing: 4,
                    
                  ),
                  ),
                ),
                ),
              SizedBox(
                height: size.height * 0.01,
              ),
              RoudedInputField(
                hintText: "Email",
                onChanged: (value) {},
                icon: Icons.email,
              ),
              RoundedPasswordField(
                onChanged: (value) {},
                text: "New Password",
              ),
              ConfirmPasswordField(
                onChanged: (value) {},
                text: "Confirm New Password",
              ),
              RoundedButton(
                text: "RESET",
                press: () {
                  Navigator.pushNamed(context, LoginScreen.id);
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
}
