
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future getdata() async {
      http.Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=38e1a46b025a646bbcab2b4978e87858'));
      // if (response.statusCode >= 200) {
        // jasondata = response.body;
        // temperature = jasondata['main']['temp'];
        // cityName = jasondata['name'].toString();
        // print(cityName);
        // print(temperature);
      // }
      return response.body;
    }