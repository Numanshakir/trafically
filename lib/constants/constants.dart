import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Constants {
  /* Colour variables */
  // static const Color PrimaryColour = Color.fromARGB(255, 0xA8, 0xE6, 0x60);
  // static const Color PrimaryColour = Color.fromARGB(255, 0x99, 0xB8, 0x65);
  // static const Color PrimaryColour = Color.fromARGB(255, 234, 177, 0);
  static const Color PrimaryColour = Colors.amber;
  static const Color GreyedColour = Color.fromARGB(255, 204, 204, 204);
  static const Color GreyedNavigationColour = Colors.grey;
  static const Color FeatureColour = Color.fromARGB(255, 150, 150, 150);
  static const Color StartPinColour = Color.fromARGB(200, 80, 200, 120);
  static const Color EndPinColour = Color.fromARGB(200, 255, 105, 97);
  static const Color ErrorToastColour = Colors.red;
  static const Color ErrorToastTextColour = Colors.white;
  static const Color PolylineColour = Colors.green;
  // colours for each magnitude level of traffic 0-4
  static const List<Color> PolylineMagnitudeColour = [
    Color.fromARGB(0xFF, 0x00, 0x00, 0x4C), // 0 magnitude
    Color.fromARGB(0xFF, 0xFF, 0xCE, 0x43), // 1 magnitude
    Color.fromARGB(0xFF, 0xFF, 0x89, 0x39), // 2 magnitude
    Color.fromARGB(0xFF, 0xF4, 0x00, 0x00), // 3 magnitude
    Color.fromARGB(0xFF, 0xC1, 0x27, 0x2D), // 4 magnitude
  ];

  /* Map Variables */
  static LatLng MapDefaultCentre = LatLng(55.601522, -3.538209);
  static const double MapDefaultZoom = 5.595;
  static const double SearchMapZoom = 10;

  /* Route Server Details */
  static const String RouteServerBaseURL = "192.168.1.61:3000";
  static const double ProblemAreaRadius = 10000;

  /* Splash Screen */
  static const Color slideOneColour = Color(0xfff5a623);
  static const Color slideTwoColour = Color(0xff203152);
  static const Color slideThreeColour = Color(0xff9932CC);
}
