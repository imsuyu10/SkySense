// ignore_for_file: non_constant_identifier_names, unnecessary_this

import 'package:http/http.dart';
import 'dart:convert';

class Worker {
  String location;

  Worker({required this.location}) {
    location = this.location;
  }
  String? temp;
  String? humidity;
  String? air_speed;
  String? description;
  String? main;
  String? icon;

  //method

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=0cf91ef415e63cb3c9c3d575a8457f5a"));

      Map data = jsonDecode(response.body);

      //Getting Temp, Humidity

      Map temp_data = data["main"];
      double getTemp = temp_data["temp"] - 273.15;

      String getHumidity = temp_data["humidity"].toString();

      //Getting air speed
      Map wind = data["wind"];
      double getAir_speed = wind["speed"] / 0.27777777777778;

      //Getting description

      List weather_data = data["weather"];
      Map weather_main_data = weather_data[0];
      String getmain_des = weather_main_data["main"];
      String getDesc = weather_main_data["description"];
      String getIcon = weather_main_data["icon"].toString();

      //Assigning values

      temp = getTemp.toString(); //C
      humidity = getHumidity; //%
      air_speed = getAir_speed.toString(); //km/hr
      description = getDesc;
      main = getmain_des;
      icon = getIcon;
    } catch (e) {
      temp = 'NA';
      humidity = 'NA';
      air_speed = 'NA';
      description = 'NA';
      main = 'NA';
      icon = 'NA';
    }
  }
}
