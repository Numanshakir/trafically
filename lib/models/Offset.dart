import 'package:flutter/material.dart';
import 'package:trafficlly/constants/style.dart';
class Offset extends StatefulWidget {
  @override
  _OffsetState createState() => _OffsetState();
}

class _OffsetState extends State<Offset> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Center(child: Text("Still Working",style: TextStyle(
        fontWeight: FontWeight.bold,
        color: primarycolor,
        fontSize: 30,
      ),),),
    );
  }
}
