import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_assignment/NewsPageHome.dart';
import 'package:weather_assignment/PreferencePage.dart';
import 'PlaceSearch.dart';
import 'src_weather/weatherCondition.dart';
import 'constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.locationWeather});
  final locationWeather;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int temperatureMax;
  int temperatureMin;
  String place;
  int humidity;
  double windSpeed;
  int pressure;
  String idIcon;
  int id;
  String desc;
  int _currentIndex = 0;
  WeatherModel weatherCondition = WeatherModel();
  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperatureMax = 0;
        temperatureMin = 0;
        desc = "Error!";
        idIcon = "-";

        place = "NULL";
        desc = "UNABLE TO FETCH DATA";
        return;
      }
      double tempMax = weatherData['main']['temp_max'];
      temperatureMax = tempMax.toInt();
      double tempMin = weatherData['main']['temp_min'];
      temperatureMin = tempMin.toInt();
      humidity = weatherData['main']['humidity'];
      pressure = weatherData['main']['pressure'];
      windSpeed = weatherData['wind']['speed'];
      id = weatherData['weather'][0]['id'];
      idIcon = weatherCondition.getWeatherIcon(id);
      desc = weatherData['weather'][0]['description'];
      place = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue.shade200.withOpacity(0.99),
            Colors.white.withOpacity(0.99),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          bottomNavigationBar: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bottomContainer(Icons.cloud_queue_rounded, "Weather", 0),
              bottomContainer(Icons.place_outlined, "Places", 1),
              bottomContainer(Icons.list, "News", 2),
              bottomContainer(Icons.person_outline, "Preference", 3),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      FloatingActionButton(
                        elevation: 1,
                        backgroundColor: Color(0xFFE8F4FF),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.near_me_sharp,
                              size: 35,
                              color: Colors.lightBlueAccent,
                            ),
                            Text(
                              "Near-ME",
                              style: TextStyle(
                                  fontSize: 8, color: Colors.lightBlueAccent),
                            ),
                          ],
                        ),
                        onPressed: () async {
                          var weatherData =
                              await weatherCondition.getLocationWeather();
                          updateUI(weatherData);
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Today's Weather Report",
                    style: kHeading,
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 30,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "$place".toUpperCase(),
                        style: kPlace,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 35,
                  ),
                  Container(
                    decoration: kWeatherBoxDecoration,
                    margin: EdgeInsets.all(15),
                    height: 250,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              child: Image(
                                image: AssetImage(
                                  "images/weather.png",
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Today: " +
                                      DateFormat()
                                          .add_MMMMEEEEd()
                                          .format(DateTime.now()),
                                  style: kDateStyle,
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "$temperatureMin°",
                                      style: TextStyle(fontSize: 40),
                                    ),
                                    SizedBox(
                                      width: 25,
                                    ),
                                    Text(
                                      "$temperatureMax°",
                                      style: TextStyle(
                                          fontSize: 40,
                                          color: Colors.grey[500]
                                              .withOpacity(0.5)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "$desc",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("Through out the day"),
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: Image(
                                      image: AssetImage(
                                        "images/humid.png",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Text("$humidity %"),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: Image(
                                      image: AssetImage(
                                        "images/pressure.png",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Text("$pressure hPa"),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: 20,
                                    width: 20,
                                    child: Image(
                                      image: AssetImage(
                                        "images/air.png",
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 17),
                                  Text("$windSpeed Mph"),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    idIcon,
                                    style: TextStyle(fontSize: 25),
                                  ),
                                  SizedBox(height: 8),
                                  Text("$id"),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                    ),
                    margin: EdgeInsets.only(top: 38),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          placesWeather("Mumbai"),
                          placesWeather("London"),
                          placesWeather("Paris"),
                          placesWeather("Chennai"),
                          placesWeather("Delhi"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget placesWeather(String textPlace) {
    return GestureDetector(
      onTap: () async {
        var topCityWeather = await weatherCondition.getCityWeather(textPlace);
        updateUI(topCityWeather);
      },
      child: Container(
        margin: EdgeInsets.all(8),
        height: 150,
        width: 130,
        decoration: kWeatherCardDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              textPlace,
              style: kCardText,
            ),
            Container(
              height: 50,
              width: 50,
              child: Image(
                image: AssetImage(
                  "images/weather.png",
                ),
              ),
            ),
            Center(
                child: Text(
              "Tap",
              style: TextStyle(color: Colors.grey.shade300),
            )),
          ],
        ),
      ),
    );
  }

  Widget bottomContainer(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() async {
          _currentIndex = index;
          if (_currentIndex == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewsPageHome()));
          } else if (_currentIndex == 1) {
            var typedName = await Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlaceSearch()));
            if (typedName != null) {
              var cityWeatherData =
                  await weatherCondition.getCityWeather(typedName);
              updateUI(cityWeatherData);
            }
          } else if (_currentIndex == 3) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Preference()));
          }
        });
      },
      child: Container(
        decoration: kBottomBoxDecoration,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.grey,
            ),
            Text(
              text,
              style: TextStyle(
                  color: Colors.grey[600], fontWeight: FontWeight.bold),
            ),
          ],
        ),
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
      ),
    );
  }
}
