import 'package:flutter/material.dart';
import 'package:world_time/pages/chose_location.dart';
import 'package:world_time/pages/loading.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/home': (context) => Home(),
      '/': (context) => Loading(),
      '/location' : (context) => ChooseLocation(),
    },
  ));
}


