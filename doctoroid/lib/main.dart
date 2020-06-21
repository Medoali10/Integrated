
import 'package:flutter/material.dart';
import 'package:doctoroid/info.dart';
import 'dart:ui';

void main() => runApp(chooseWidget(window.defaultRouteName));
 
Widget chooseWidget(String route){
  switch(route){
    case 'r1': 
      return MyApp();
    default:
      return MyApp();
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Doctoroid',
      routes: {
        '/': (context) => Info(),
      },
    );
  }
}



