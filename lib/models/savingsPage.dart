import 'package:flutter/material.dart';
import 'package:flutter_gauge/flutter_gauge.dart';

import 'package:trafficlly/constants/style.dart';
class Usage extends StatefulWidget {
  @override
  _UsageState createState() => _UsageState();
}

class _UsageState extends State<Usage> {

  double totalCO2kg = 0;
  double carbonOffset = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white ,
      child: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: <Widget>[
          GestureDetector(onTap: () {
            // updateGauge();
          },child: CircleAvatar(backgroundColor: primarycolor,child: Icon(Icons.refresh,color: Colors.black,size: 30,),maxRadius: 25,)),
          Padding(padding: EdgeInsets.only(top: 25)),
          Container(
            alignment: Alignment.center,
            child: generateGauge(),
          ),
          Text("CO2 g/km",style: TextStyle(color: Colors.black),),
        ],
      ),
    );
  }
  Widget generateGauge() {

    return
    //   Container(
    //   height: 300,
    //   width: 300,
    //   decoration: BoxDecoration(
    //     image: DecorationImage(image: AssetImage("assets/gauge.png")),
    //   ),
    // );
      new FlutterGauge(
        isDecimal: true,
        activeColor: Colors.red,
        indicatorColor: Colors.black,
        handColor: primarycolor,
        width: 280,
        start: 0,
        end: totalCO2kg.round(),
    index: totalCO2kg - carbonOffset,
    counterStyle: TextStyle(
    color: Colors.black,
    fontSize: 25,
    ),
    secondsMarker: SecondsMarker.secondsAndMinute,
    number: Number.endAndCenterAndStart,
    numberInAndOut: NumberInAndOut.outside,
    );
  }
  // Future<void> updateGauge() async {
  //   setState(() {
  //     updating = true;
  //   });
  //
  //   double co2kg = await updateCO2kg(_user);
  //   double offset = await updateOffset(_user);
  //
  //   setState(() {
  //     updating = false;
  //   });
  // }
}
