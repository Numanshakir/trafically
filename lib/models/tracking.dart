
import 'package:flutter/material.dart';
import 'package:trafficlly/common_widgets/avatar.dart';
import 'package:trafficlly/constants/style.dart';

class Track extends StatefulWidget {
  Key key;

  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          child: Container(
            color: primarycolor,
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                  child: Container(
                    color: Colors.transparent,
                    width: 250,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("From :"),
                        Text("To :"),
                      ],
                    ),
                  ),
                ),
                Text(
                  "END",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          preferredSize: Size(20, 50),
          key: widget.key,
        ),
        titleSpacing: 80,
        title: Text(
          "Trafficly",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: primarycolor,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.72,
              width: MediaQuery.of(context).size.width,
              color: Colors.blue,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 45,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.grey,
                          child: Stack(
                            children: <Widget>[
                              Avatar(
                                photoUrl: " ",
                                radius: 20,
                                borderColor: Colors.white,
                                borderWidth: 4,
                              ),
                              Positioned(
                                  top: 10,
                                  left: 70,
                                  child: Text(
                                    "Current Location",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                width: 4,
                                color: primarycolor,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .65,
                                color: Colors.white,
                                child:Text(
                                  "Simply just wrap your Text widget to FittedBox widget like, Here I want to resize my AppBar text based on width ",

                                ),
                              ),
                              Icon(
                                Icons.open_in_new,
                                color: primarycolor,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              child: Container(
            color: primarycolor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("0.000"),
                Text(
                  "${TimeOfDay.now()}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "Track",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
