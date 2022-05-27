import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
  void getCurrentLocaion() async {
    var currentLocation = "";
  var Latitude = "";
  var Longitude = "";
  var temperature = 0.0;
  var cityName;
    try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("permission denied");
        }
      }
    } catch (e) {
      getCurrentLocaion();
    }

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    print(position.latitude);
    print(position.longitude);

    dynamic jasondata;
    
    double lon = position.longitude;
    double lat = position.latitude;
    
    // cityName = locationWeather['name'].toString();

    
  }