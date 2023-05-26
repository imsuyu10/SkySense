// ignore_for_file: non_constant_identifier_names, override_on_non_overriding_member, prefer_const_constructors, unused_import

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart';
import 'package:mausam/worker/worker.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String? city = "Kerala";
  String? temp;
  String? humidity;
  String? air_speed;
  String? desc;
  String? main;
  String? icon;

  void startApp(String? city) async {
    Worker instance = Worker(location: "$city");
    await instance.getData();

    temp = instance.temp;
    humidity = instance.humidity;
    air_speed = instance.air_speed;
    desc = instance.description;
    main = instance.main;
    icon = instance.icon;

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, "/loading", arguments: {
        "temp_value": temp,
        "hum_value": humidity,
        "air_speed_value": air_speed,
        "description_value": desc,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)?.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search!['searchText'];
    }
    startApp(city);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 180),
                Image.asset(
                  "images/logo.png",
                  scale: 3,
                ),
                SizedBox(
                  height: 13,
                ),
                Text(
                  "Mausam App",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Made By Suyu",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: 8,
                ),
                SpinKitThreeBounce(
                  color: Color.fromARGB(255, 33, 94, 125),
                  size: 20.0,
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 182, 230, 254),
      ),
    );
  }
}
