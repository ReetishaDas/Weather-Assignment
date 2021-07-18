import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_assignment/PreferencePage.dart';
import 'NewsPageHome.dart';
import 'constants.dart';

const apiKey = 'a5da03527972e03f03668804c1e8e1df';

class PlaceSearch extends StatefulWidget {
  @override
  _PlaceSearchState createState() => _PlaceSearchState();
}

class _PlaceSearchState extends State<PlaceSearch> {
  String cityName;
  int _currentIndex = 1;
  double latitude;
  double longitude;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bottomContainer(Icons.cloud_queue_rounded, "Weather", 0),
          bottomContainer(Icons.place_outlined, "Places", 1),
          bottomContainer(Icons.list, "News", 2),
          bottomContainer(Icons.person_outline, "Preference", 3),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                ),
                Container(
                    height: 300,
                    width: 300,
                    child: Image.asset("images/weather.png")),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    width: double.infinity,
                    child: TextFormField(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(235),
                            ),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Search by city name",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search),
                          suffixIcon: Icon(Icons.location_on_outlined)),
                      onChanged: (value) {
                        cityName = value;
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, cityName);
                  },
                  child: Text("Get Weather"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomContainer(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          if (_currentIndex == 2) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NewsPageHome()));
          } else if (_currentIndex == 0) {
            Navigator.pop(context);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        height: 60,
        width: MediaQuery.of(context).size.width / 4,
      ),
    );
  }
}
