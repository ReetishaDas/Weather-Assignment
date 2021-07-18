import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_assignment/home_screen.dart';
import 'package:weather_assignment/src_weather/weatherCondition.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
    print("this method is triggered");
  }

  void getLocationData() async {
    //class constructor used only once so direct implementation
    var weatherData = await WeatherModel().getLocationWeather();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(locationWeather: weatherData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
