import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'ListViewModel.dart';
import 'customcard.dart';

class FindPlayer extends StatefulWidget {
  static const String id = 'FindPlayer';
@override
_FindPlayerState createState()=>_FindPlayerState();
}
class _FindPlayerState extends State<FindPlayer> {
 
    List allUsers=[];
Future <List<dynamic>> fetchdata() async {
 Uri BASE_URL =Uri.parse('http://localhost:3000/getallUsers/') ;
 
    var res = await http.get(BASE_URL);
    
     if (res.statusCode == 200) {
   
      var data = json.decode(res.body)['users'];
      print(data);
      setState(() { 
       for(var ma in data){
         var m= (ma["name"]);
          allUsers.add(m);
      // }
     // print(json.decode(res.body)['users']);
    
       
      }
     });
          print(allUsers);
  }
  return allUsers;   
}
  @override
  void initState() {
super.initState();
   
   fetchdata();

  }

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
        appBar: AppBar( 
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          centerTitle: true,
          title: Text(
            "Find Players",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              fontFamily: "Raleway",
              letterSpacing: 5,
              color: Colors.white70,
            ),
          ),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body:ListView.builder(
          itemCount:allUsers.length,
          itemBuilder:(context,index){
            return customcard(name:allUsers[index]);
            
          } ,
        ),
      ),
    );
  }
  
}
