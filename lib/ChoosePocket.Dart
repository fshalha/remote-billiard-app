import 'package:flutter/material.dart';
import 'package:remote_billiard/backEnd_conn/game_communication.dart';
class ChoosePocket extends StatefulWidget {
  static const String id = 'ChoosePocket';
   const ChoosePocket ({
    Key key,
   this.opponentId,
  }) : super(key: key);

  final String opponentId;
  
@override
  _ChoosePocketState createState() => _ChoosePocketState();
}
class _ChoosePocketState  extends State<ChoosePocket> {
 
  @override
  Widget build(BuildContext context) {
    return Container(
    alignment: Alignment.center,
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
            children:<Widget>[
             Text("Choose a Pocket",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: "Acme",
                  letterSpacing: 5,
                  color: Colors.blue[200],
                ),) , 
            
            Container(
             margin: EdgeInsets.all(15), 
             child:Image.asset("./assets/pockets.png",
             height: 250,
             width: 500,
             )
            
            ),
           
           
               Container(
              margin: EdgeInsets.all(15),  
              child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                           Material(  //Wrap with Material
      shape: CircleBorder(side: BorderSide(
            color: Colors.amber[700],
            width:3,
            style: BorderStyle.solid
          ),),
                  child:
                MaterialButton(
              onPressed: () {
                  _onchoosepocket(widget.opponentId,"1");
              },
              color:Colors.amberAccent[200],
                textColor:Colors.blue[900],
              child: Text('1'
              ),
            padding: EdgeInsets.all(30),
            shape: CircleBorder(),
            ),),
                Material(  //Wrap with Material
      shape: CircleBorder(side: BorderSide(
            color: Colors.amber[700],
            width:3,
            style: BorderStyle.solid
          ),),
                  child:MaterialButton(
              onPressed: () {
                  _onchoosepocket(widget.opponentId,"2");
              },
            color:Colors.amberAccent[200],
                textColor:Colors.blue[900],
              child: Text('2'
              ),
            padding: EdgeInsets.all(30),
            shape: CircleBorder(),
            ),),
              
              ],
            )
            ),
            Container(
              margin: EdgeInsets.all(15),  
              child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Material(  //Wrap with Material
      shape: CircleBorder(side: BorderSide(
            color: Colors.amber[700],
            width:3,
            style: BorderStyle.solid
          ),),
                  child:
                MaterialButton(
              onPressed: () {
                  _onchoosepocket(widget.opponentId,"3");
              },
            color:Colors.amberAccent[200],
                textColor:Colors.blue[900],
              child: Text('3'
              ),
            padding: EdgeInsets.all(30),
            shape: CircleBorder(),
            ),),
               Material(  //Wrap with Material
      shape: CircleBorder(side: BorderSide(
            color: Colors.amber[700],
            width:3,
            style: BorderStyle.solid
          ),),
                  child:
                MaterialButton(
              onPressed: () {
                  _onchoosepocket(widget.opponentId,"4");
              },
           color:Colors.amberAccent[200],
                textColor:Colors.blue[900],
              child: Text('4'
              ),
            padding: EdgeInsets.all(30),
            shape: CircleBorder(),
            ),),
              
              ],
            )
            ),
            
            Container(
              margin: EdgeInsets.all(15),  
              child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                 Material(  //Wrap with Material
      shape: CircleBorder(side: BorderSide(
            color: Colors.amber[700],
            width:3,
            style: BorderStyle.solid
          ),),
                  child:
                MaterialButton(
              onPressed: () {
                  _onchoosepocket(widget.opponentId,"5");
              },
        color:Colors.amberAccent[200],
                textColor:Colors.blue[900],
              child: Text('5'
              ),
            padding: EdgeInsets.all(30),
            shape: CircleBorder(),
            ),),
               Material(  //Wrap with Material
      shape: CircleBorder(side: BorderSide(
            color: Colors.amber[700],
            width:3,
            style: BorderStyle.solid
          ),),
                  child:
                MaterialButton(
              onPressed: () {
                  _onchoosepocket(widget.opponentId,"6");
              },
           color:Colors.amberAccent[200],
                textColor:Colors.blue[900],
              child: Text('6'
              ),
            padding: EdgeInsets.all(30),
            shape: CircleBorder(),
            ),),
              
              ],
            )
            ),
            
            
            
              
            ])
                 
          )),
    );
    
  
  }
   _onchoosepocket(String opponentId, String pocket) {
    // We need to send the opponentId to initiate a new game
    game.send('choosepocket', "$opponentId;$pocket");

  }
}
