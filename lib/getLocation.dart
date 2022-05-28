import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'apiJsonbody.dart';
void getConnection() async{
  try {
      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print("permission denied");
        }
      }
    } catch (e) {
      getConnection();
    }
}
  Future getCurrentLocaionLatitude() async {
    getConnection();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position.latitude;
  }

  Future getCurrentLocaionLongitude() async {
  getConnection();

    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return position.longitude;

  }