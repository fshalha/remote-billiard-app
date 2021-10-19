import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remote_billiard/FindPlayer.dart';
import 'package:remote_billiard/PlayerDataScreen.dart';
import './FindPlayer.dart';
import 'backEnd_conn/game_communication.dart';

class SelectOptions extends StatelessWidget {
  static const String id = 'SelectOptions';
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
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                fontSize: 35,
                letterSpacing: 5,
                color: Colors.blue[200],
              ),
              ),
            ),
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
                      'Registered Players',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    color: Colors.blue[200],
                textColor: Colors.blue[900],
                    onPressed: () {    
                      game.send('getallUsers',game.playerID);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FindPlayer()));
                   
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(25),
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    child: Text(
                      'Find players',
                      style: TextStyle(fontSize: 17.0),
                    ),
                   color: Colors.blue[200],
                textColor: Colors.blue[900],
                    onPressed: () {
                          game.send('request_players_list', game.playerID);
                       Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayerDataScreen()));
                    },
                  ),
                ),
                
                /* Container(
                  margin: EdgeInsets.all(25),
                  child: FlatButton(
                    child: Text(
                      'Play New Game',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    color: Colors.blue[200],
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ExitPage()));
                    },
                  ),
                )*/
              ]))),
    );
  }
}
