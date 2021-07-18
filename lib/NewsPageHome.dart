import 'package:flutter/material.dart';
import 'package:weather_assignment/PlaceSearch.dart';
import 'news/newsPage.dart';
import 'PreferencePage.dart';
import 'constants.dart';

class NewsPageHome extends StatefulWidget {
  @override
  _NewsPageHomeState createState() => _NewsPageHomeState();
}

class _NewsPageHomeState extends State<NewsPageHome> {
  int _currentIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          bottomContainer(Icons.cloud, "Weather", 0),
          bottomContainer(Icons.place, "Places", 1),
          bottomContainer(Icons.file_copy_outlined, "News", 2),
          bottomContainer(Icons.person_rounded, "Preference", 3),
        ],
      ),
      body: SafeArea(
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
          child: NewsPage(),
        ),
      ),
    );
  }

  Widget bottomContainer(IconData icon, String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
          if (_currentIndex == 0) {
            Navigator.pop(context);
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
          } else if (_currentIndex == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PlaceSearch()));
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
