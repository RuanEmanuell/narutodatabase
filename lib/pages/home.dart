import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mobx/flutter_mobx.dart';

import "../main.dart";
import "loading.dart";
import "claninfo.dart";

import "../stores/appdata.dart";




class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=>_HomeScreen();
}



class _HomeScreen extends State<HomeScreen>{


  @override
  Widget build(BuildContext context){


    return Scaffold(
      appBar:AppBar(
        centerTitle:true,
        backgroundColor:Colors.white,
        elevation:0,
        title:Text("Select a Clan", style:TextStyle(
          color:Colors.black,
          fontSize:25,
          fontWeight:FontWeight.bold))
      ),
      body:Center(
        child:Container(
        color:Colors.white,
        child:ListView.builder(
          itemCount:appData.data[0]["Available Clan Details"].length-1,
          itemBuilder:(context, index){

            var clanColor;
            var clanName=appData.data[0]["Available Clan Details"][index];


            clanName=="Aburame"? clanColor=Color.fromARGB(255, 199, 245, 172):clanColor;
            clanName=="Akimichi"? clanColor=Color.fromARGB(255, 207, 81, 49):clanColor;
            clanName=="Chinoike"? clanColor=Color.fromARGB(255, 209, 25, 0):clanColor;
            clanName=="Hatake"? clanColor=Color.fromARGB(255, 153, 153, 153):clanColor;
            clanName=="Hyuga"? clanColor=Color.fromARGB(255, 185, 208, 226):clanColor;
            clanName=="Hozuki"? clanColor=Color.fromARGB(255, 127, 195, 240):clanColor;
            clanName=="Inuzuka"? clanColor=Color.fromARGB(255, 226, 54, 1):clanColor;
            clanName=="Izuno"? clanColor=Color.fromARGB(255, 0, 145, 5):clanColor;
            clanName=="Kaguya"? clanColor=Color.fromARGB(255, 219, 219, 219):clanColor;
            clanName=="Lee"? clanColor=Colors.green:clanColor;
            clanName=="Nara"? clanColor=Color.fromARGB(255, 101, 177, 103):clanColor;
            clanName=="Sarutobi"? clanColor=Color.fromARGB(255, 57, 177, 61):clanColor;
            clanName=="Senju"? clanColor=Color.fromARGB(255, 228, 60, 38):clanColor;
            clanName=="Uchiha"? clanColor=Color.fromARGB(255, 224, 15, 0):clanColor;
            clanName=="Uzumaki"? clanColor=Color.fromARGB(255, 250, 121, 0):clanColor;
            clanName=="Yamanaka"? clanColor=Color.fromARGB(255, 98, 151, 103):clanColor;
            clanName=="Otsutsuki"? clanColor=Color.fromARGB(255, 163, 144, 162):clanColor;


            return InkWell(
            child:Container(
                margin:EdgeInsets.only(top:20, bottom:10, right:15, left:15),
                padding:EdgeInsets.all(20),
                decoration:BoxDecoration(
                  color:clanColor,
                  borderRadius:BorderRadius.circular(20)
                ),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text(clanName, style:TextStyle(
                      fontSize:18
                    )),
                    Container(width: 10),
                    Icon(Icons.info_outline)
                  ]
                )
            ),
            onTap:(){
              Navigator.push(context,
               MaterialPageRoute(
                builder:(context)=>ClanInfo(clanName: clanName, clanColor:clanColor)
               ));
            }
            );
          }
        )
        )
        ),
        bottomNavigationBar: BottomNavigationBar(
          items:[
            BottomNavigationBarItem(
              icon:Icon(Icons.home),
              label:"Home"
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
        ),
    );
  }
}