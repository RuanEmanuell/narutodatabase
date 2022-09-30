import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mobx/flutter_mobx.dart';


import "../main.dart";
import "home.dart";


import "../stores/appdata.dart";


//Credits Screen


class CreditsScreen extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.center,
        children:[
          Container(
            padding:EdgeInsets.only(right:95, left:95, top:20, bottom:20),
            margin:EdgeInsets.all(20),
            decoration:BoxDecoration(
              color:Color.fromARGB(255, 202, 202, 202),
              borderRadius:BorderRadius.circular(20)
            ),
            child:Text("App by: Ruan Emanuell")
          ),
          Container(
            padding:EdgeInsets.all(20),
            margin:EdgeInsets.all(20),
            decoration:BoxDecoration(
              color:Color.fromARGB(255, 202, 202, 202),
              borderRadius:BorderRadius.circular(20)
            ),
            child:Text("Api: Naruto Database by Premkumar Arumugam")
          ),
          Container(
            padding:EdgeInsets.only(right:60, left:60, top:20, bottom:20),
            margin:EdgeInsets.all(20),
            decoration:BoxDecoration(
              color:Color.fromARGB(255, 202, 202, 202),
              borderRadius:BorderRadius.circular(20)
            ),
            child:Text("App developed on purpose of study.")
          )
        ]
      )
      ),
      bottomNavigationBar: BottomNavigationBar(
         selectedItemColor:Colors.black,
         unselectedItemColor:Colors.blue,
          items:[
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label:"Home",
            ),
            BottomNavigationBarItem(
              icon:Icon(Icons.question_mark),
              label:"Credits"
            ),
          ],
          onTap:((value) {
            if(value==0){
              Navigator.pushNamed(context, "/home");
            }
            if(value==1){
               Navigator.pushNamed(context, "/credits");
            }
          })
        )
    );
  }
}


