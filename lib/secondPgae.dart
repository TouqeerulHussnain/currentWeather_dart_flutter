import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:lab9/secondScreen.dart';
import 'package:lab9/weather.dart';
import 'apiJsonbody.dart';
import 'dart:convert';
var latitude;
  var longitude;
  
  
  
class secondPage extends StatefulWidget {
  double? temperature;
  String? cityName;
  String? weatherIcon;
  String? weatherMsg;
  
  double? Latiude;
  double? Longitude;
  secondPage({@required this.temperature,this.cityName , this.weatherIcon, this.weatherMsg}) ;
  void updateUI() async{
  }
  getLatitueLongitude(latitude, longitude){
    Latiude = latitude;
    Longitude = longitude;
  }
  
  @override
  State<secondPage> createState() => _secondPageState();
  
}

class _secondPageState extends State<secondPage> {
double? temperature;
  String? cityName;
  String? weatherIcon;
  String? weatherMsg;
  double? Latiude;
  double? Longitude;
  
void initState() {
  super.initState();
    widget.updateUI();
    temperature = widget.temperature;
    cityName= widget.cityName;
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
            ElevatedButton(
              onPressed: () {
                // getCurrentLocaion();
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Get Location',
                  style: TextStyle(fontSize: 30),
                ),
              ),
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
            SizedBox(
              height: 20,
            ),
            Text("response "),
            ElevatedButton(
              onPressed: () {
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Next Screen',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}