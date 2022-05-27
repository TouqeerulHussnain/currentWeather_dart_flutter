import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:html';
// import 'package:http/http.dart';
import "dart:convert";
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var currentLocation = "";
  var Latitude = "";
  var Longitude = "";
  var temperature = 0.0;
  var cityName;
  @override
  void getCurrentLocaion() async {
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
    Future getdata() async {
      http.Response response = await http.get(Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=38e1a46b025a646bbcab2b4978e87858'));
      // if (response.statusCode >= 200) {
        jasondata = response.body;
        temperature = jasondata['main']['temp'];
        cityName = jasondata['name'].toString();
        print(cityName);
        print(temperature);
      // }
    }
    // cityName = locationWeather['name'].toString();

    setState(() {
      Longitude = position.longitude.toString();
      Latitude = position.latitude.toString();
      print(temperature);
    });
  }

  void initState() {
    super.initState();
    getCurrentLocaion();
  }

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
                getCurrentLocaion();
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
              "Latitude :  $Latitude",
              style: TextStyle(fontSize: 20),
            ),
            Text(
              "Latitude :  $Longitude",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(
              height: 20,
            ),
            Text("response "),
            ElevatedButton(
              onPressed: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => SecondScreen(),
                //     )
                //     );
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
