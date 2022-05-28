import 'package:flutter/material.dart';
import 'package:lab9/weather.dart';
import 'dart:convert';

  
  
  
class secondPage extends StatefulWidget {
   double temperature = 0.0;
   String? cityName;
   String? weatherIcon;
  String? weatherMsg;
  // var latitude;
  // var longitude;
  double? Latitude;
  double? Longitude;
  var weathercode;
  var jsondata ;
  dynamic locationWeather;
  
  secondPage({required jsondata}){
     temperature = jsonDecode( jsondata)['main']['temp'];
     weathercode = jsonDecode( jsondata)['weather'][0]['id'];
    weatherIcon = Weather().getWeatherIcon(weathercode);
    weatherMsg = Weather().getMessage(temperature);
     cityName = jsonDecode( jsondata)['name'].toString();
     Latitude = jsonDecode( jsondata)['coord']['lat'];
     Longitude = jsonDecode( jsondata)['coord']['lon'];
    }
  
  @override
  State<secondPage> createState() => _secondPageState();
  
}

class _secondPageState extends State<secondPage> {
  Weather weather = Weather();
double? temperature;
  String? cityName;
  String? weatherIcon;
  String? weatherMsg;
  double? latitude;
  double? longitude;
 @override 
void initState() {
  super.initState();
    temperature = widget.temperature;
    cityName= widget.cityName;
    latitude = widget.Latitude;
    longitude = widget.Longitude;
    weatherIcon = widget.weatherIcon;
    weatherMsg = widget.weatherMsg;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.location_on,
              size: 100,
              color: Colors.red,
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Latitude : $latitude ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "longitude : $longitude ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Temparature : $temperature ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "City name : $cityName ",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              weatherIcon.toString(),
              style: TextStyle(fontSize: 20),
            ),
            Text(
              weatherMsg.toString(),
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}