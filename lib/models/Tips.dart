import 'package:flutter/material.dart';
class tips extends StatefulWidget {
  @override
  _tipsState createState() => _tipsState();
}

class _tipsState extends State<tips> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("assets/fuel-tips.jpg"),fit: BoxFit.fill),
      ),
    );
  }
}
