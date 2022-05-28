import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:html';
import 'getLocation.dart';
import 'apiJsonbody.dart';
// import 'package:http/http.dart';
import "dart:convert";
import 'package:http/http.dart' as http;
import 'secondPgae.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'weather.dart';
void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);
  
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  @override
  void getCurrentLocaion() async {

    var lat = await getCurrentLocaionLatitude();
    var lon = await getCurrentLocaionLongitude();
    var jsondata = await getJsonbody(latitiude: lat,longitude: lon);
    print(lat);
    print(lon);
    // var jsondata = await getJsonbody(latitiude: latitude,longitude: longitude);
    var temperature = jsonDecode( jsondata)['main']['temp'];
    var weathercode = jsonDecode( jsondata)['weather'][0]['id'];
    // weatherIcon = weatherModel.getWeatherIcon(weathercode);

    var cityName = jsonDecode( jsondata)['name'].toString();
    print(temperature);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return secondPage(temperature: temperature, cityName:cityName ,);
      }));
  }

  void initState() {
    super.initState();
    getCurrentLocaion();
  }

  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Center(child: SpinKitDoubleBounce(color: Colors.grey, size: 40)),
      ),
    );;
  }
}
