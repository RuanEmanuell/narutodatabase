import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mobx/flutter_mobx.dart';

import "../main.dart";
import "loading.dart";
import "home.dart";

import "../stores/appdata.dart";

//Clan Info Screen


class ClanInfo extends StatefulWidget{
  var clanName, clanColor;
  ClanInfo({required this.clanName, required this.clanColor});

  @override
  _ClanInfo createState()=> _ClanInfo();
}


class _ClanInfo extends State<ClanInfo>{

  
  void initState(){
    super.initState();
    setState((){
      loading=true;
    });
    fetchClanData();
  }

  fetchClanData() async{

   final response=await http.get(Uri.parse("https://naruto-details.herokuapp.com/clan?name=${widget.clanName.toLowerCase()}"));

   if(response.statusCode==200){
   appData.clanData=response.body;
   appData.clanData=jsonDecode(appData.clanData);


    setState((){
      loading=false;
      error=false;
    });
      
    
    }else{
     setState((){
      loading=false;
      error=true;
     });
    }
  }
  
  @override
  Widget build(BuildContext context){
    var screenSize=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        centerTitle: true,
        backgroundColor:Colors.white,
        elevation:0,
        title:Text("${widget.clanName}", style:TextStyle(
          color:Colors.black
        )),
        leading:IconButton(
          icon: Icon(
          Icons.arrow_back, 
          color:Colors.black
          ),
          onPressed:(){
            Navigator.pop(context);
          })
      ),
      body:  loading ? Center(
       child:Container(
       width:100, 
       height:100,
       child:CircularProgressIndicator()
       )) : error ? Center(
       child:ElevatedButton(
       child:Text("Try again"),
       onPressed:(){
        fetchClanData();
       }
       )):Center(
        child:Container(
          color:Colors.white,
          child:ListView.builder(
            itemCount:appData.clanData.length,
            itemBuilder:(context, index) {
              return Stack(
              children:[
              Container(
              padding:EdgeInsets.all(30),
              margin:EdgeInsets.only(
                top:40,
                bottom:40,
                right:15,
                left:15

              ),
              decoration:BoxDecoration(
                color:widget.clanColor,
                borderRadius:BorderRadius.circular(20),
              ),
              child:Container(
                margin:EdgeInsets.only(left: 70),
                child: Column(
                children:[
                  appData.clanData[index]["1. Name"] != null ? Text("Name: ${appData.clanData[index]["1. Name"]}", style:TextStyle(
                    fontSize:15,
                    fontWeight:FontWeight.bold
                  )) : Container(),

                  appData.clanData[index]["1.  Name"] != null ? Text("Name:${appData.clanData[index]["1.  Name"]}", 
                  style:TextStyle(
                    fontSize:15,
                    fontWeight:FontWeight.bold
                  )) : Container(),

                  Container(height: 10),

                  appData.clanData[index]["2. Appearance"] != null ? 
                    Text("First episode: ${appData.clanData[index]["2. Appearance"]}"): Text("First episode: No data"),

                  Container(height: 10),

                  appData.clanData[index]["4. Team"] != null ? Text("Team: ${appData.clanData[index]["4. Team"]}") : Text("Team: No data"),
                ]
              )
              )
              ),
              Container(
                margin:EdgeInsets.only(top: 15),
                child:Image.asset("lib/assets/${appData.clanData[index]["1. Name"]}.webp", width: appData.clanData[index]["1. Name"]=="Mito Uzumaki"?70: 115),
              )
              ]
              );
            },
          )
        )
       )
    );
  }
}


