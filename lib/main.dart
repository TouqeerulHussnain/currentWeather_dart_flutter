import 'package:flutter/material.dart';
import 'getLocation.dart';
import 'apiJsonbody.dart';
import 'LocationScreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

///----------
import 'package:geolocator/geolocator.dart';

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
  void getCurrentLocaion() async {
    getConnection();
    var lat = await getCurrentLocaionLatitude();
    var lon = await getCurrentLocaionLongitude();
    var jsondata = await getJsonbody(latitiude: lat, longitude: lon);

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return secondPage(jsondata: jsondata);
    }));
  }

  @override
  void initState() {
    super.initState();
    getCurrentLocaion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitDoubleBounce(color: Colors.grey, size: 40)),
    );
  }
}
