import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trafficlly/fonts/maki_icons.dart';
String fromlocationaddress = "Tap to enter from location";
String toloactionaddress = "Tap to enter to location";

Color primarycolor = Colors.amber;
Color stopdefaultcolor=Colors.grey;
Color stopcheckcolor=primarycolor;
int itemchecked=33;
List<bool> item=[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,];
List<String> stopstype=[
  "cafe",
  "cemetery",
  "church",
  "convenience_store",
  "bank",
  "gas_station",
  "grocery",
  "gym",
  "laundry",
  "library",
  "mosque",
  "museum",
  "park",
  "parking",
  "pharmacy",
  "post_office",
  "restaurant",
  "shopping_mall",
  "supermarket",
  "tourist_attraction",]
  ;
List<IconData> icondata = [
  Maki.cafe,
  Maki.cemetery,
  Maki.religious_christian,
  Maki.grocery_store,
 Maki.credit_card,
  Maki.fuel,
  Maki.grocery_store,
  Maki.bicycle,
Icons.local_laundry_service,
  Maki.library_icon,
  Maki.religious_islam,
  Maki.museum,
Maki.tree_2,
Icons.local_parking,
Maki.pharmacy,
Maki.post,
Maki.restaurant,
Maki.shop,
Maki.grocery_store,
Icons.flag,

];
