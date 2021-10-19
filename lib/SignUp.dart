import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remote_billiard/SelectOptions.dart';
import 'NetworkHandler.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool vis = true;
  final _gloabalkey = GlobalKey<FormState>();
  NetworkHandler networkHandler = NetworkHandler(); //api handlings

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  @override
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
          child: Form(
            key: _gloabalkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign up with email",
                  style: GoogleFonts.bowlbyOne(
                    color: Colors.white,
                    fontSize: 30,
                    //fontWeight: FontWeight.bold,
                    //letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                usernameTextField(),
                emailTextField(),
                passwordTextField(),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                     Navigator.push(context,
                     MaterialPageRoute(builder: (context)=>SelectOptions()),);
                    if (!_gloabalkey.currentState.validate()) {
                      //send data rest server
                      Map<String, String> data = {
                        "name": _usernameController.text,
                        "email": _emailController.text,
                        "password": _passwordController.text
                      };
                      print(data);
                      networkHandler.post("/adduser", data);
                    }
                  },
                  child: Container(
                      width: 150,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                )
              ],
            ),
          )),
    ),
   );
  }

  Widget usernameTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
      child: Column(
        children: [
          Text(
            "Username",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextFormField(
            validator: (value) {
              if (!value.isEmpty) return "Username can't be empty";
              return null;
            },
            controller: _usernameController,
            decoration: InputDecoration(
              // errorText: validate ? null : errorText,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
      child: Column(
        children: [
          Text(
            "Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextFormField(
            validator: (value) {
              if (!value.isEmpty) return "Password can't be Empty";
              if (value.length <= 8)
                return "Password must be at least 8 character long";
              return null;
            },
            obscureText: vis,
            controller: _passwordController,
            decoration: InputDecoration(
              suffixIcon: IconButton(
                  icon: Icon(vis ? Icons.visibility_off : Icons.visibility),
                  onPressed: () {
                    setState(() {
                      vis = !vis;
                    });
                  }),
              helperText: "Password should have more than 8 characters",
              helperStyle: TextStyle(fontSize: 12, color: Colors.green),
              // errorText: validate ? null : errorText,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10.0),
      child: Column(
        children: [
          Text(
            "Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          TextFormField(
            validator: (value) {
              if (!value.isEmpty) return "Email can't be empty";
              if (!value.contains("@")) return "Email is invalid";
              return null;
            },
            controller: _emailController,
            decoration: InputDecoration(
              // errorText: validate ? null : errorText,
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                  width: 2,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
