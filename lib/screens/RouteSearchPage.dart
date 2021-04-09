import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trafficlly/constants/constants.dart';
import 'package:trafficlly/constants/style.dart';
import 'package:trafficlly/maphelper/dart/google_map_helper.dart';
import 'package:trafficlly/models/seachlocation.dart';
import 'package:trafficlly/models/tracking.dart';


class RouteSearchPage extends StatefulWidget {
  @override
  _RouteSearchPageState createState() => _RouteSearchPageState();
}

class _RouteSearchPageState extends State<RouteSearchPage> {
  static final CameraPosition _ukMap = CameraPosition(
    target: Constants.MapDefaultCentre,
    zoom: Constants.MapDefaultZoom,
  );
 // var apis = Apis();
  final LatLng fromlocation=LatLng(28.4212, 70.2989);
Position from=Position(latitude: 28.4212,longitude:70.2989 );
Position to=Position(latitude: 30.1575,longitude:71.5249 );
  final LatLng toLocation=LatLng(30.1575, 71.5249);
  List<LatLng> listPoints = <LatLng>[LatLng(30.1575, 71.5249),LatLng(28.4212, 70.2989)];
  int _polylineIdCounter = 1;
  GoogleMapController _mapController;
 // List<Routes> routesData;
  // List<Place> _places;
  // List<POI> _pointsOfInterest;
  // List<PointOfInterest> _stops;
  // Set<Polyline> _polylines;
  // Set<Marker> _markers;
  Set<Circle> _circles;
  //RouteQueryResponse _response;
  bool _searching;
  GMapViewHelper _gMapViewHelper=GMapViewHelper();
  List<bool> newitem=[false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,false,];
  double _width = 0;
  Key key;
  double time_hight = 0;
  double stops_hight = 0;
  DateTime date = DateTime.now();
  bool check = false;
  // Object for PolylinePoints
  PolylinePoints polylinePoints= PolylinePoints();

// List of coordinates to join
  List<LatLng> polylineCoordinates = [];

// Map storing polylines created by connecting
// two points
  Map<PolylineId, Polyline> polylines = {};
  Map<MarkerId, Marker> _markers = <MarkerId, Marker>{};
  Map<PolylineId, Polyline> _polyLines = <PolylineId, Polyline>{};
  void _onMapCreated(GoogleMapController controller) async {
    this._mapController = controller;

    // polylines: Set<Polyline>.of(polylines.values);
//    Firestore.instance.collection('rideRequest').getDocuments().then((value) {
//      addMarker(
//          LatLng(double.parse(value.documents[0].data['Olat']),
//              double.parse(value.documents[0].data['Olan'])),
//          LatLng(double.parse(value.documents[0].data['Dlat']),
//              double.parse(value.documents[0].data['Dlan'])));
//    });
//    distance = await _locationService.distanceBetween(
//        28.3111, 70.1261, 28.4212, 70.2989);
//distance=await _locationService.distanceBetween(24.8607, 67.0011,30.1575, 71.5249);
  }

  // Create the polylines for showing the route between two places

  _createPolylines(LatLng start, LatLng destination) async {
    final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
    final PolylineId polylineId = PolylineId(polylineIdVal);

    PolylineResult result=  await polylinePoints.getRouteBetweenCoordinates(
      "tjAt3aXHyDsqDMDajasduifeaEfsdfoa", // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,

    );

    print(result.status.toString()+"------------------------------------");
     // _polyLines[polylineId] = GMapViewHelper.createPolyline(
      //   polylineIdVal: polylineIdVal,
      //   router: router,
      //   formLocation: fromlocation,
      //   toLocation: toLocation,
      // );

    //
    //
    // // Initializing PolylinePoints
    // polylinePoints = PolylinePoints();
    //
    // // Generating the list of coordinates to be used for
    // // drawing the polylines
    // PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
    //   "AIzaSyDDMsq3uvAltfbqIw8_7E3zD-BocTeIl0c", // Google Maps API Key
    //   PointLatLng(start.latitude, start.longitude),
    //   PointLatLng(destination.latitude, destination.longitude),
    //   travelMode: TravelMode.transit,
    // );

    // Adding the coordinates to the list

      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        print( polylineCoordinates.length);
        print("length");
      });
      print( polylineCoordinates);


    // Defining an ID
    PolylineId id = PolylineId('poly');

    // Initializing Polyline
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );

    // Adding the polyline to the map
    polylines[id] = polyline;
  }
  addMarker(String location,LatLng loclatlang) {
    final MarkerId _markerFrom = MarkerId(location);
     LatLng fromLocation=loclatlang;
    // markers[_geo] = GMapViewHelper.createMaker(
    //
    //   markerIdVal: "Geolocation",
    //   icon: checkPlatform
    //       ? "assets/image/driving_pin.png"
    //       : "assets/image/driving_pin.png",
    //   lat: currentLoc?.latitude,
    //   lng: currentLoc?.longitude,
    //
    // );
    _markers[_markerFrom] = GMapViewHelper.createMaker(
      markerIdVal: "fromLocation",
      icon:
           "assets/go-logo.png",
      lat: fromLocation?.latitude,
      lng: fromLocation?.longitude,
    );


  }
  // void getRouter() async {
  //   final String polylineIdVal = 'polyline_id_$_polylineIdCounter';
  //   final PolylineId polylineId = PolylineId(polylineIdVal);
  //   // polyLines.clear();
  //   var router;
  //
  //   await apis
  //       .getRoutes(
  //     getRoutesRequest: GetRoutesRequestModel(
  //         fromLocation: fromlocation,
  //         toLocation: toLocation,
  //         mode: "driving"),
  //   )
  //       .then((data) {
  //     if (data != null) {
  //       router = data.result.routes[0].overviewPolyline.points;
  //       routesData = data.result.routes;
  //     }
  //   }).catchError((error) {
  //     print("DiscoveryActionHandler::GetRoutesRequest > $error");
  //   });
  //
  //
  //
  //   _polyLines[polylineId] = GMapViewHelper.createPolyline(
  //     polylineIdVal: polylineIdVal,
  //     router: router,
  //     formLocation: fromlocation,
  //     toLocation: toLocation,
  //   );
  //   setState(() {});
  //   final GoogleMapController controller = await _mapController;
  //   _gMapViewHelper.cameraMove(
  //     fromLocation: fromlocation,
  //     toLocation: toLocation,
  //     mapController: controller,
  //   );
  // }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addMarker("from", LatLng(30.1575, 71.5249));
    _createPolylines(LatLng(30.1575, 71.5249),LatLng(28.4212, 70.2989));
   addMarker("to", LatLng(28.4212, 70.2989));

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _gMapViewHelper.buildMapView(
                context: context,
                onMapCreated: _onMapCreated,

                currentLocation: LatLng(28.4212, 70.2989),
                markers: _markers,
                polyLines: _polyLines,

                onTap: (_) {}),

            Container(
              padding: EdgeInsets.all(10),
              height: 200,
              width: MediaQuery.of(context).size.width,
              //color: primarycolor,
              child: Column(
                children: <Widget>[
                  Container(
                    color: primarycolor,
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "From",
                          style: TextStyle(color: Colors.white),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(bottom: 3),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => searchloc(
                                          locaddress: "from",
                                          key: key,
                                        ),
                                      ));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  height: 30,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.yellow[200],
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Center(
                                          child: Text(
                                        fromlocationaddress,
                                        style: TextStyle(color: Colors.grey[400]),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(
                              Icons.arrow_downward,
                              color: Colors.white,
                              size: 17,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    color: Colors.grey[400],
                    height: MediaQuery.of(context).size.height * 0.06,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "To     ",
                          style: TextStyle(color: Colors.white),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => searchloc(
                                          locaddress: "to",
                                          key: key,
                                        ),
                                      ));
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 10),
                                  height: 30,
                                  width: 230,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: Colors.white
                                  ),
                                  child: Row(
                                    children: <Widget>[
                                      Center(
                                          child: Text(
                                        toloactionaddress,
                                        style: TextStyle(color: Colors.grey[400]),
                                      )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.arrow_upward,
                              color: Colors.white,
                              size: 17,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          child: Container(
                            color: primarycolor,
                            height: 40,
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  "Depart Now",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Icon(
                                  time_hight == 0
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_up,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            if (check == true) {
                              setState(() {
                                check = false;
                              });
                            } else if (check == false) {
                              setState(() {
                                check = true;
                              });
                            }
                            checkclicked();
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            color: primarycolor,
                            height: 40,
                            width: 110,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  "Stops",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                                Icon(
                                  stops_hight == 0
                                      ? Icons.keyboard_arrow_down
                                      : Icons.keyboard_arrow_up,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            if (check == true) {
                              setState(() {
                                check = false;
                              });
                            } else if (check == false) {
                              setState(() {
                                check = true;
                              });
                            }
                            checkstopsclicked();
                          },
                        ),
                        GestureDetector(

                          onTap: () {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => Track(),));
                          },
                          child: Container(
                            color: primarycolor,
                            height: 40,
                            width: 100,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  "Plan",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              top: 150,
              right: 5,
              left: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.linear,
                  width: MediaQuery.of(context).size.width,
                  height: time_hight,
                  color: Colors.yellow,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: CupertinoDatePicker(
                          initialDateTime: date,
                          onDateTimeChanged: (DateTime newDate) {
                            setState(() {
                              date = newDate;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  print("date picked");
                                  setState(() {
                                    date = DateTime.now();
                                  });
                                  time_hight = 0;
                                  //   checkclicked();
                                },
                                child: Text(
                                  "Now",
                                  style: TextStyle(
                                      color: primarycolor,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  time_hight = 0;
                                  //checkclicked();
                                },
                                child: Text(
                                  "set",
                                  style: TextStyle(
                                      color: primarycolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 150,
              right: 5,
              left: 5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 100),
                  curve: Curves.linear,
                  width: MediaQuery.of(context).size.width,
                  height: stops_hight,
                  color: Colors.yellow,
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 170,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.white,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 0,
                                  crossAxisCount: 5,
                                  mainAxisSpacing: 0),
                          itemCount: 21,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.all(5),
                              child: GestureDetector(
                                onTap: () {
                                  print("index is =" + index.toString());
                                  setState(() {
                                    item[index]=true;
                                  });
                                },
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  color: Colors.transparent,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Icon(
                                        icondata[index],
                                        size: 30,
                                        color: item[index]==true?stopcheckcolor:stopdefaultcolor,
                                      ),
                                      Text(
                                        "${stopstype[index]}",
                                        style: TextStyle(fontSize: 10,color:  item[index]==true?stopcheckcolor:stopdefaultcolor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              GestureDetector(
                                onTap: () {

                                  setState(() {

                                    stops_hight = 0;
                                    item.addAll(newitem);
                                  });
                                },
                                child: Text(
                                  "Clear",
                                  style: TextStyle(
                                      color: primarycolor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    stops_hight = 0;
                                  });
                                },
                                child: Text(
                                  "set",
                                  style: TextStyle(
                                      color: primarycolor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  checkclicked() {
    if (check == true) {
      setState(() {
        time_hight = 200;
      });
    } else if (check == false) {
      setState(() {
        time_hight = 0;
      });
    }
  }

  checkstopsclicked() {
    if (check == true) {
      setState(() {
        stops_hight = 200;
      });
    } else if (check == false) {
      setState(() {
        stops_hight = 0;
      });
    }
  }
}
