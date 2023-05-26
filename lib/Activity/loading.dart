// ignore_for_file: sort_child_properties_last

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:string_capitalize/string_capitalize.dart';

class LoadingActivity extends StatefulWidget {
  const LoadingActivity({super.key});

  @override
  State<LoadingActivity> createState() => _LoadingActivityState();
}

class _LoadingActivityState extends State<LoadingActivity> {
  TextEditingController searchController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    var city_name = ["Delhi", "Mumbai", "Gorakhpur", "Faizabad"];
    Random _random = new Random();

    var city = city_name[_random.nextInt(city_name.length)];

    Map info = ModalRoute.of(context)!.settings.arguments as Map;
    String temp = ((info["temp_value"]).toString()).substring(0, 2);
    String air = ((info["air_speed_value"]).toString()).substring(0, 2);

    String icon = info['icon_value'];
    String getCity = info['city_value'];
    String hum = ((info["hum_value"]).toString()).substring(0, 2);
    ;
    String desc = (info['description_value']).toString().capitalizeEach();

    return SafeArea(
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: const [
                  Color.fromARGB(255, 182, 230, 254),
                  Color.fromARGB(255, 101, 172, 182)
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  //search wala container

                  padding: EdgeInsets.symmetric(horizontal: 8),

                  margin: EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(25)),

                  child: Row(
                    children: [
                      GestureDetector(
                          onTap: () {
                            if ((searchController.text).replaceAll(" ", "") ==
                                "") {
                              print('');
                            } else {
                              Navigator.pushReplacementNamed(context, '/home',
                                  arguments: {
                                    "searchText": searchController.text,
                                  });
                            }
                          },
                          child: Container(
                            child: Icon(
                              Icons.search,
                              color: Colors.blueAccent,
                            ),
                            margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                          )),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: "$city"),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 25),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Image.network(
                                "http://openweathermap.org/img/wn/$icon@2x.png"),
                            SizedBox(
                              width: 18,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "$desc",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "$getCity",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        margin: EdgeInsets.only(left: 25, top: 25, right: 25),
                        padding: EdgeInsets.all(26),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$temp',
                                  style: TextStyle(fontSize: 80),
                                ),
                                Text('C',
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w400)),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 170,
                        margin: EdgeInsets.fromLTRB(25, 0, 10, 25),
                        padding: EdgeInsets.all(19),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.day_windy),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '$air',
                                    style: TextStyle(fontSize: 50),
                                  ),
                                  Text(
                                    'km/hr',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 170,
                        margin: EdgeInsets.fromLTRB(10, 0, 25, 25),
                        padding: EdgeInsets.all(19),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(WeatherIcons.humidity),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, left: 25),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    '$hum',
                                    style: TextStyle(fontSize: 50),
                                  ),
                                  Text(
                                    'Percent',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      "Made By Suyu",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text("Data Provided By Openweather Map",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w300)),
                  ],
                ),
                SizedBox(
                  height: 130,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
