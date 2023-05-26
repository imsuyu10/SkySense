// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mausam/Activity/home.dart';
import 'package:mausam/Activity/loading.dart';
import 'package:mausam/Activity/location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Home(),
      "/loading": (context) => LoadingActivity(),
      "/location": (context) => LocationActivity(),
      "/home": (context) => Home()
    },
  ));
}
