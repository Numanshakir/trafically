import 'package:flutter/material.dart';
import 'package:trafficlly/screens/Login_screen.dart';
import 'package:trafficlly/screens/Splash_screen.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Traficlly",
      home:splashscreen(),
    );
  }
}
