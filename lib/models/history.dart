import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trafficlly/common_widgets/platform_alert_dialog.dart';
import 'package:trafficlly/compunents/flutter_clipboard_manager.dart';
import 'package:trafficlly/compunents/fluttertoast.dart';
import 'package:trafficlly/constants/style.dart';
import 'package:trafficlly/data/User.dart';
class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

class _historyState extends State<history> {
  User _user;
  List<HistoryModel> _journeyHistory=List<HistoryModel>();

  bool _updating=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _journeyHistory.add(HistoryModel("Rahim Yar khan", "Sadiqabad", 25.000, DateTime.now(), 0.002, 0.003,"Petrol"));
    _journeyHistory.add(HistoryModel("Krachi", "Multan", 25.000, DateTime.now(), 0.002, 0.003,"Petrol"));
    _journeyHistory.add(HistoryModel("Faisalabd", "Lahore", 25.000, DateTime.now(), 0.002, 0.003,"Petrol"));
    _journeyHistory.add(HistoryModel("Khan Pur", "Sadiqabad", 25.000, DateTime.now(), 0.002, 0.003,"Petrol"));
    _journeyHistory.add(HistoryModel("Pindi", "Multan", 25.000, DateTime.now(), 0.002, 0.003,"Petrol"));
    _journeyHistory.add(HistoryModel("AllaBad", "Lahore", 25.000, DateTime.now(), 0.002, 0.003,"Petrol"));
    // getHistory();

  }
  // Future<void> getHistory() async {
  //   setState(() {
  //     _journeyHistory = [];
  //     _updating = true;
  //   });
  //
  //   final QuerySnapshot result = await _user.ref
  //       .collection("previous_journeys")
  //       .orderBy("date_added", descending: true)
  //       .getDocuments();
  //   final List<DocumentSnapshot> documents = result.documents;
  //
  //   documents.forEach((document) {
  //     _journeyHistory.add(
  //       HistoryModel(
  //         document['from'],
  //         document['to'],
  //         document['distance_meters'],
  //         document['date_added'],
  //         document['CO2_gkm'],
  //         document['CO2_kg'],
  //         document['fuel_type'],
  //       ),
  //     );
  //   });
  //
  //   //TODO Crash?
  //
  //   setState(() {
  //     _updating = false;
  //   });
  // }
  Future<void> _confirmClearHistory(BuildContext context) async {
    final bool didRequestSignOut = await PlatformAlertDialog(
      title: "Clear History",
      content: "Are you sure you want to clear your history?",
      cancelActionText: "Cancel",
      defaultActionText: "Clear",
    ).show(context);
    if (didRequestSignOut == true) {
      _clearHistory();
    }
  }
  Future<void> _clearHistory() {
    // _user.ref.collection("previous_journeys").getDocuments().then((snapshot) {
    //   for (DocumentSnapshot ds in snapshot.documents) {
    //     ds.reference.delete();
    //   }
    // });
    setState(() {
      _journeyHistory = [];
    });
  }
  @override
  Widget build(BuildContext context) {
    if (_updating) return CircularProgressIndicator();
    return Container(
     child: Column(
       children: <Widget>[
         Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height*0.62,
           color: Colors.transparent,
           child: ListView.builder(
             itemCount: _journeyHistory.length  ,
             itemBuilder: (context, index) {
               return Container(
width: MediaQuery.of(context).size.width,
height: 45,
 color: Colors.grey[200],
             child: Column(
               children: <Widget>[
                 Container(
                   padding: EdgeInsets.all(5),
                   width: MediaQuery.of(context).size.width,
                   height: 40,
                   color: index % 2 == 0 ? Colors.white : Colors.grey[200],
                   child: Text(
                       "${_journeyHistory[index].from} to ${_journeyHistory[index].to} (${(_journeyHistory[index].distanceMeters * 0.001).toStringAsFixed(3)} km, ${_journeyHistory[index].co2kg.toStringAsFixed(3) ?? 0.0}kg CO2)"),
                 ),
                 Divider(
                   color: Colors.grey[600],
                   height: 5,
                 ),


               ],

             ),
               );
             },
           ),
         ),
         Container(

           color: Colors.transparent,
           child: Row(
             mainAxisAlignment:  MainAxisAlignment.spaceBetween,
             children: <Widget>[
               Padding(
                 padding: const EdgeInsets.only(left: 10),
                 child: GestureDetector(
                   onTap: () {
                  _exportHistory();
                   },
                   child: Container(

                     height: 40,
                      width: 100,
                     decoration: BoxDecoration(
                       color: primarycolor,
                       borderRadius: BorderRadius.circular(3),
                     ),
                     child: Center(
                       child: Text("Copy CSV",style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                       ),),
                     ),
                   ),
                 ),
               ),
               Padding(

                 padding: const EdgeInsets.only(right: 10),
                 child: GestureDetector(
                   onTap: () {
                     _confirmClearHistory(context);
                   },
                   child: Container(
                     height: 40,
                     width: 100,
                     decoration: BoxDecoration(
                       color: primarycolor,
                       borderRadius: BorderRadius.circular(3),
                     ),
                     child: Center(
                       child: Text("Clear History",style: TextStyle(
                           color: Colors.black,
                           fontWeight: FontWeight.bold
                       ),),
                     ),
                   ),
                 ),
               ),
             ],
           ),
         )
       ],
     ),
    );
  }
//////////////////////////////////copy to clip
  Future<void> _exportHistory() {
    String csv = "From,To,Distance(Meters),Date,CO2 g/km,CO2 kg,Fuel Type,";
    _journeyHistory.forEach((journey) {
      csv +=
      '\n"${journey.from}","${journey.to}",${journey.distanceMeters},${journey
          .date},${journey.co2gkm.toStringAsFixed(4)},${journey.co2kg
          .toStringAsFixed(4)},${journey.fuelType},';
    });

    FlutterClipboardManager.copyToClipBoard(csv).then((result) {
      if (result) {
        Fluttertoast.showToast(
            msg: "Data copied to clipboard!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 3,
            backgroundColor: primarycolor,
            textColor: Colors.black,
            fontSize: 16.0);
      }
    });
  }
}
class HistoryModel {
  String from;
  String to;
  double distanceMeters;
  DateTime date;
  double co2gkm;
  double co2kg;
  String fuelType;

  HistoryModel(this.from, this.to, this.distanceMeters, this.date, this.co2gkm,
      this.co2kg, this.fuelType);
}