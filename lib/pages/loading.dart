import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mobx/flutter_mobx.dart';

import "../main.dart";
import "home.dart";

import "../stores/appdata.dart";

//Loading Screen

//MOBX
var appData=AppData();

bool loading=true;
bool error=false;


class LoadingScreen extends StatefulWidget{
  @override
  _LoadingScreen createState()=> _LoadingScreen();
}


class _LoadingScreen extends State<LoadingScreen>{

  //Fetching data from the API
  fetchData() async{
  final response=await http.get(Uri.parse("https://naruto-details.herokuapp.com/clan"));

  if(response.statusCode==200){
    appData.data=response.body;
    appData.data=jsonDecode(appData.data);
    
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

    void initState(){
    super.initState();
    fetchData();    
  }



  @override
  Widget build(BuildContext context){
    return Scaffold(
      //Defining what is going to appear in the screen, based on the loading and error bools
      body:  loading ? Center(
       child:Container(
       width:100, 
       height:100,
       child:CircularProgressIndicator()
       )) : error ? Center(
       child:ElevatedButton(
       child:Text("Try again"),
       onPressed:(){
        fetchData();
       }
       )) : HomeScreen()
    );
  }
}