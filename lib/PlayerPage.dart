   
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:yoyo_player/yoyo_player.dart';
import 'ChoosePocket.dart';
import 'package:video_player/video_player.dart';
import 'ChatPage.dart';
import 'ExitPage.dart';
import 'backEnd_conn/game_communication.dart';

class PlayerPage extends StatefulWidget {
   static const String id='PlayerPage';
  const PlayerPage({
    Key key,
     this.streamUrl,
     this.opponentName,
      this.opponentId,
      this.character,
      
  }) : super(key: key);

  get data => null;

  static Route<dynamic> route(String url) {
    return MaterialPageRoute<dynamic>(
      builder: (BuildContext context) {
        return PlayerPage(streamUrl: url);
      },
    );
  }

final String streamUrl;
final String opponentName;
final String opponentId;

final String character;
  @override
  _PlayerPageState createState() => _PlayerPageState();
}

class _PlayerPageState extends State<PlayerPage> {
    VideoPlayerController _controller;
   final url = "https://www.youtube.com/watch?v=QDFAZKefV34";

  String get opponentId => null;

  String get opponentName => null;

  String get data => null;

    @override
  void initState() {
    super.initState();
    game.addListener(_onChat);
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  
   
    
  }

  @override
  void dispose() {
    game.removeListener(_onChat);
    super.dispose();
  }

  /// -------------------------------------------------------------------
  /// This routine handles all messages that are sent by the server.
  /// In this page, only the following 2 actions have to be processed
  ///  - players_list
  ///  - new_game
  /// -------------------------------------------------------------------
  _onChat(message) {
    print(message);
    switch (message["action"]) {

      case 'Chat':
        // split message data
        var data = message["data"].split(";");
        Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (BuildContext context) => new ChatPage(
                opponentName: data[0], // Name of the opponent
                opponentId: data[1],
        
              ),
            ));
        break;
        
      case 'CallForFoul':
        // split message data
      
      var data = message["data"].split(";");
      var playerid=data[1];

       _onFoul(playerid,opponentId);
        
        break;
           
      case 'notifications':
        // split message data
        var data = message["data"];
        _onFoulNotification(data);
      
        
        break;

       case 'choosepocket':
        // split message data
        var data = message["data"];
        _onpocketnumber(data);
      
        
        break;
        case 'toss':
        // split message data
       var data = message["data"];
        _ontoss(data);
      
        
        break;

    }
  }
  

 /* @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  }))*/
  /* @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }*/

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
      return Container(
       
      
      decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blue, Colors.black])),
        child: Scaffold(
          
            // By defaut, Scaffold background is white
            // Set its value to transparent
            backgroundColor: Colors.transparent,
            body: Center(child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:<Widget>[
              Container(
              child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: 16 / 9,
                  child: VideoPlayer(_controller),
                )
              : Container(),
              
        ),
       /* Container(
          floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _controller.value.isPlaying
                  ? _controller.pause()
                  : _controller.play();
            });
          },
          child: Icon(
            _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
          ),
        ),
        ),*/
             /* Expanded(
              flex: 3,
              child: YoYoPlayer(
                aspectRatio: 16 / 9,
                url: widget.streamUrl ?? "",
                videoStyle: VideoStyle(),
                videoLoadingStyle: VideoLoadingStyle(),
              ),
            ),*/
            Container( 
               margin: EdgeInsets.all(25),
               child:Text(widget.data ?? "",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 10,
                    fontFamily: "Open sans",
                    letterSpacing: 5,
                    color: Colors.blue[100],
                  ),) , 
            ),
              Container(  
                margin: EdgeInsets.all(25),  
                // ignore: deprecated_member_use
                child: FlatButton(  
                  child: Text('Call For Foul', style: TextStyle(fontSize: 17.0),),  
                  color: Colors.blue[200],  
                  textColor: Colors.black,  
                  onPressed: () {
                    game.send("CallForFoul",widget.opponentId);

                  },  
                ),  
              ),  
             
              Container(
                margin: EdgeInsets.all(15),  
                child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                onPressed: () {
                     
                    Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>ChoosePocket(
                          opponentId: widget.opponentId, 
                      )));
                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Choose\nPocket'
                ),
              padding: EdgeInsets.all(25),
              shape: CircleBorder(),
              ),
                
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.blue,
                      shape: CircleBorder(),
                  ),
                child: IconButton(
                  icon: Icon(Icons.chat),
                  iconSize: 48,
                  color: Colors.white,
                  onPressed: () {
                    game.send("Chat",widget.opponentId);
                    Navigator.push(context,
                      MaterialPageRoute(builder:(context)=>ChatPage(
                          opponentName: widget.opponentName, 
                      )));
        },
      ),
                ),
                
                
                ],
              )
              ),
                Container(
                margin: EdgeInsets.all(15),  
                child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Container(
                  margin: EdgeInsets.all(25),
                  child: FlatButton(
                    minWidth: 200.0,
                    height: 100.0,
                    child: Text(
                      'TOSS',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    color: Colors.blue[200],
                    textColor: Colors.black,
                    shape: CircleBorder(),
                    onPressed: () {
                          game.send('toss',widget.opponentId);
                    
                    },
                  ),
                )
                
                ],
              )
              ),
                
              ])
                  
            )),
      );
      
  }
   _onFoul(String playerid, String opponentId) {
    // First ask the favor to the stream the game
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Call For Foul",
                style: TextStyle(
                  color: Colors.white,
                )),
            content: new Text(
              "Do You want to call for foul ?",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.lightBlue[900],
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                onPressed: () {
                  // remove pop up message
                  Navigator.of(context).pop();
            
                },
                child: new Text(
                  "NO",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              // ignore: deprecated_member_use
              new FlatButton(
                onPressed: () {
                  // remove pop up message
                  Navigator.of(context).pop();
                  // send to the server     // start the game
                  _onStartGame(playerid, opponentId, "Yes");
                },
                child: new Text(
                  "YES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
            ],
          );
        });
  }

  _onStartGame(String playerid, String opponentId, String stream) {
    // We need to send the opponentId to initiate a new game
    game.send('sendfoul', "$opponentId;$playerid;$stream");

  
  }
   
   _onFoulNotification(String data) {
    // First ask the favor to the stream the game
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Foul Status",
                style: TextStyle(
                  color: Colors.white,
                )),
            content: new Text(
              "Foul Accepted",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.lightBlue[900],
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                onPressed: () {
                  // remove pop up message
                  Navigator.of(context).pop();
                  // send to the gam
                },
                child: new Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
         
            ],
          );
        });
  }
     _onpocketnumber(String data) {
    // First ask the favor to the stream the game
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Pocket",
                style: TextStyle(
                  color: Colors.white,
                )),
            content: new Text(
              "opponent player selected pocket $data",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.lightBlue[900],
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                onPressed: () {
                  // remove pop up message
                  Navigator.of(context).pop();
                  // send to the gam
                },
                child: new Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
         
            ],
          );
        });
  }
    _ontoss(String data) {
    // First ask the favor to the stream the game
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text("Toss",
                style: TextStyle(
                  color: Colors.white,
                )),
            content: new Text(
              "$data won the toss",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.lightBlue[900],
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                onPressed: () {
                  // remove pop up message
                  Navigator.of(context).pop();
                  // send to the gam
                },
                child: new Text(
                  "OK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
         
            ],
          );
        });
  }

  
}