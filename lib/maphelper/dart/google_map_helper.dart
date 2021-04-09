import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:trafficlly/constants/style.dart';
// import 'package:trafficlly/constants/style.dart';


class GMapViewHelper {
// List of coordinates to join
  List<LatLng> polylineCoordinates = [];
  GMapViewHelper();

  Widget buildMapView({
    @required BuildContext context,
    @required Map<MarkerId, Marker> markers,
    Map<PolylineId, Polyline> polyLines = const <PolylineId, Polyline>{},
    MapCreatedCallback onMapCreated,
    ArgumentCallback<LatLng> onTap,
    @required LatLng currentLocation
  }) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(

       zoomGesturesEnabled: true,
       zoomControlsEnabled: false,
        onMapCreated: onMapCreated,
        onTap: onTap,
        markers: Set<Marker>.of(markers.values),
        polylines: Set<Polyline>.of(polyLines.values),
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(
          target: LatLng(currentLocation.latitude, currentLocation.longitude),
          zoom: 12.0,
        ),
      ),
    );
  }

  static Marker createMaker ({
    @required String markerIdVal,
    @required String icon,
    @required double lat,
    @required double lng, GestureTapCallback onTap,}){
    final MarkerId markerId = MarkerId(markerIdVal);

    final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(lat, lng),
        icon: BitmapDescriptor.fromAsset(icon),
        onTap: onTap
    );

    return marker;
  }

  static Polyline createPolyline ({

    @required String polylineIdVal,
    @required final router,
    @required LatLng formLocation,
    @required LatLng toLocation,
  }){
 // if(router==null){
 //   List<LatLng> listPoints = <LatLng>[LatLng(30.1575, 71.5249),LatLng(28.4212, 70.2989)];
 //   // List<dynamic> _points = <dynamic>[];
 //   // List<dynamic> latLong = <dynamic>[];
 //   // List<dynamic> lngLong = <dynamic>[];
 //   final PolylineId polylineId = PolylineId(polylineIdVal);
 //
 //   // LatLng _createLatLng(double lat, double lng) {
 //   //   return LatLng(lat, lng);
 //   // }
 //   //
 //   // var _router = decode(router);
 //   // for (int lat = 0; lat < _router.length; lat += 2) {
 //   //   latLong.add(_router[lat]);
 //   // }
 //   // for (int lng = 1; lng < _router.length; lng += 2) {
 //   //   lngLong.add(_router[lng]);
 //   // }
 //   // for (int i = 0; i < latLong.length; i++) {
 //   //   _points.add([latLong[i], lngLong[i]]);
 //   // }
 //   // for (int i = 0; i < _points.length; i++) {
 //   //   listPoints.add(_createLatLng(_points[i][0], _points[i][1]));
 //   // }
 //
 //   final Polyline polyline = Polyline(
 //     polylineId: polylineId,
 //     consumeTapEvents: true,
 //     color: primarycolor,
 //     width: 6,
 //     points: listPoints,
 //   );
 //   return polyline;
 // }else
// List of coordinates to join
    List<LatLng> polylineCoordinates = [];
   //
   // List<LatLng> listPoints = <LatLng>[];
   // List<dynamic> _points = <dynamic>[];
   // List<dynamic> latLong = <dynamic>[];
   // List<dynamic> lngLong = <dynamic>[];
   final PolylineId polylineId = PolylineId(polylineIdVal);
   //
   // LatLng _createLatLng(double lat, double lng) {
   //   return LatLng(lat, lng);
   // }
   //
   // var _router = decode(router);
   // for (int lat = 0; lat < _router.length; lat += 2) {
   //   latLong.add(_router[lat]);
   // }
   // for (int lng = 1; lng < _router.length; lng += 2) {
   //   lngLong.add(_router[lng]);
   // }
   // for (int i = 0; i < latLong.length; i++) {
   //   _points.add([latLong[i], lngLong[i]]);
   // }
   // for (int i = 0; i < _points.length; i++) {
   //   listPoints.add(_createLatLng(_points[i][0], _points[i][1]));
   // }
    // Adding the coordinates to the list
    if (router.points.isNotEmpty) {
      router.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        print( polylineCoordinates.length);
        print("length");
      });
      print( polylineCoordinates);
    }

    // // Defining an ID
    // PolylineId id = PolylineId('poly');
    //
    // // Initializing Polyline
    // Polyline polyline = Polyline(
    //   polylineId: id,
    //   color: Colors.red,
    //   points: polylineCoordinates,
    //   width: 3,
    // );
    //
    // // Adding the polyline to the map
    // polylines[id] = polyline;

   final Polyline polyline = Polyline(
     polylineId: polylineId,
     consumeTapEvents: true,
     color: primarycolor,
     width: 6,
     points: polylineCoordinates,
   );
   return polyline;

  }

  void cameraMove({
    @required LatLng fromLocation,
    @required LatLng toLocation,
    @required GoogleMapController mapController,

  }) async {
    var _latFrom = fromLocation.latitude;
    var _lngFrom = fromLocation.longitude;
    var _latTo = toLocation.latitude;
    var _lngTo = toLocation.longitude;
    var sLat, sLng, nLat, nLng;

    if(_latFrom <= _latTo) {
      sLat = _latFrom;
      nLat = _latTo;
    } else {
      sLat = _latTo;
      nLat = _latFrom;
    }

    if(_lngFrom <= _lngTo) {
      sLng = _lngFrom;
      nLng = _lngTo;
    } else {
      sLng = _lngTo;
      nLng = _lngFrom;
    }

    return mapController?.animateCamera(
      CameraUpdate?.newLatLngBounds(
        LatLngBounds(
          southwest: LatLng(sLat, sLng),
          northeast: LatLng(nLat, nLng),
        ),
        16.0,
      ),
    );
  }
}
