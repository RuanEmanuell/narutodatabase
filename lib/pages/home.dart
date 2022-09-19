import "package:flutter/material.dart";
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_mobx/flutter_mobx.dart';

import "../main.dart";
import "loading.dart";

import "../stores/appdata.dart";






class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=>_HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Center(child: Text("cu"))
    );
  }
}