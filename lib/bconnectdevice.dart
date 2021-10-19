import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remote_billiard/bluetooth_conn/bluetoothConn.dart';
import 'package:remote_billiard/bluetooth_conn/bluetoothConn.dart';


class bconnectdevice extends StatelessWidget {
  static const String id = 'bconnectdevice';
  @override
  Widget build(BuildContext context) {
   
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.grey[900],Colors.blue[900]])),
      child: Scaffold(
          // By defaut, Scaffold background is white
          // Set its value to transparent
          backgroundColor: Colors.transparent,
          body: Center(child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,

          children: <Widget>[
           
            Text(
              "Remote Billiard",
              style:GoogleFonts.lobster(
              textStyle:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                letterSpacing: 5,
                color: Colors.blue[200],
              ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(25),
                child: Image.asset(
                  "./assets/logo.png",
                  height: 75,
                  width: 125,
                )),
            Container(
              margin: EdgeInsets.all(25),
              child: Text(
                "Virtual Billiard Platform",
               style:GoogleFonts.dancingScript(
              textStyle:TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 4,
                color: Colors.blue[200],
              ),
              ),
            ),
            ),
            Container(
              margin: EdgeInsets.all(25),
              // ignore: deprecated_member_use
              
              child: FlatButton(
                child: Text(
                  'CONNECT DEVICE',
                  style:GoogleFonts.raleway(
              textStyle: TextStyle(fontSize: 17.0),
               fontWeight: FontWeight.bold,
                letterSpacing: 3,
        
                ),),
                color: Colors.blue[200],
                textColor: Colors.blue[900],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BluetoothPage()));
                },
              ),
            ),
          ]))),
    );
  }
}