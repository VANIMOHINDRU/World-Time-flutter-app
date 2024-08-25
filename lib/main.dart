import 'package:flutter/material.dart';
import 'package:world_time/Pages/choose_location.dart';
//import 'pages/home.dart'
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main() {
  runApp(MaterialApp(
  initialRoute: '/',
    routes:{
      '/':(context)=>Loading(),
      '/home':(context)=>Home(),
      '/location':(context)=> ChooseLocation(),
    },
  ));
}

