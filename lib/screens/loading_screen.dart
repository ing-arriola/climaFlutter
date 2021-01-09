import 'package:flutter/material.dart';
import '../services/location.dart';
import '../services/networking.dart';

const apiKey = 'de86cb3f70d019c1e17200d5630464e8';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  void getCurrentLocation() async {
    Location location = Location();
    await location.getLocation();
    longitude = location.longitude;
    latitude = location.latitude;
    Networking networking = Networking(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey');
    var weatherData = await networking.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
