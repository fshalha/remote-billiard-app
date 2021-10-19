import 'package:flutter/material.dart';
import 'package:remote_billiard/Toss.dart';

//import 'ListViewModel.dart';

class customcard extends StatelessWidget {
   customcard({ Key key,this.name }) : super(key: key);
var  name;
  @override
  Widget build(BuildContext context) {

    return Card(
      elevation: 1.5,
      
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: ListTile(
          tileColor: Colors.blue[200],
          title: Row(
            children: <Widget>[
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.circular(60/2),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image:AssetImage("./assets/user.jpg")
                  )
                ),
              ),
              SizedBox(width: 20,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    width: MediaQuery.of(context).size.width-140,
                    child: Text(name,style: TextStyle(fontSize: 17),)),
                  SizedBox(height: 10,),
                  
                ],
              )
            ],
          ),
          onTap:(){
            Navigator.push(context,
            MaterialPageRoute(builder: (context)=>Toss()),);
          }
        ),
      ),
    );
  }
  }
