import 'package:flutter/material.dart';

const kHeading = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.w400,
  fontFamily: 'Ptserif',
);

const kPlace = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
);

var kWeatherBoxDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.black.withOpacity(0.2),
      blurRadius: 10.0,
      spreadRadius: 5.0,
    ),
  ],
  border: Border.all(color: Colors.grey[200]),
  borderRadius: BorderRadius.all(
    Radius.circular(45),
  ),
);

const kDateStyle = TextStyle(fontWeight: FontWeight.bold);

var kWeatherCardDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    new BoxShadow(
      color: Colors.white.withOpacity(0.2),
      blurRadius: 10.0,
      spreadRadius: 5.0,
    ),
  ],
  border: Border.all(color: Colors.grey[200]),
  borderRadius: BorderRadius.all(
    Radius.circular(30),
  ),
);

const kCardText = TextStyle(
  fontSize: 17,
  fontFamily: 'Ptserif',
  fontWeight: FontWeight.bold,
);

var kBottomBoxDecoration = BoxDecoration(
  boxShadow: [
    new BoxShadow(
      color: Colors.grey[100],
      blurRadius: 20.0,
      spreadRadius: 10.0,
    ),
  ],
  color: Colors.white,
);

var kNewsBoxDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ],
  borderRadius: BorderRadius.only(
      topLeft: Radius.circular(35),
      topRight: Radius.circular(35),
      bottomLeft: Radius.circular(35),
      bottomRight: Radius.circular(35)),
);

const kNewsTitleDeco =
    TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700);

const kNewsSummaryDeco =
    TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold);
