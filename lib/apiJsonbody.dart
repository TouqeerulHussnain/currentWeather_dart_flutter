
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
Future getJsonbody({@required latitiude, longitude}) async {
      http.Response response = await http.get(Uri.parse(
          'http://api.openweathermap.org/data/2.5/weather?units=metric&lat=$latitiude&lon=$longitude&appid=931e8bdeccb205992200128a5f3a3e95'));
          // http://api.openweathermap.org/data/2.5/weather?units=metric&lat=$lat&lon=$lon&appid=931e8bdeccb205992200128a5f3a3e95
      // https://api.openweathermap.org/data/2.5/weather?lat=$latitiude&lon=$longitude&appid=38e1a46b025a646bbcab2b4978e87858
      print(response.statusCode);
      return response.body;
    }