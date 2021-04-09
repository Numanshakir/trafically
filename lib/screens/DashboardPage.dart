import 'package:flutter/material.dart';
import 'package:trafficlly/constants/style.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:trafficlly/fonts/maki_icons.dart';
import 'package:trafficlly/models/Offset.dart';
import 'package:trafficlly/models/Tips.dart';
import 'package:trafficlly/models/history.dart';
import 'package:trafficlly/models/savingsPage.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
 //TabController _controller=TabController(length: 4,);
 // int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.card_travel)),
    Tab(icon: Icon(Icons.add_shopping_cart)),
  ];

  @override
  void initState() {
    // TODO: implement initState

   // _controller =  TabController(  vsync: this);
    super.initState();
    // Create TabController for getting the index of current tab

    // _controller.addListener(() {
    //   setState(() {
    //     _selectedIndex = _controller.index;
    //   });
    //   print("Selected Index: " + _controller.index.toString());
    // });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 10,
          automaticallyImplyLeading: false,
          title: Text(
            "Dashboard",
            style: TextStyle(color: Colors.black),
          ),
          bottom: PreferredSize(
            preferredSize: Size(MediaQuery.of(context).size.width,70),
            child: TabBar(
             // controller: _controller,
              indicatorColor: Colors.white,
           //   unselectedLabelColor: Colors.white,
              // labelColor: Colors.amber,
              tabs: [
                Container(height: 70,width: 50,child: Column(
                  children: <Widget>[
                    Tab(icon: new Icon(IconData(0xF42F, fontFamily: "CupertinoIcons"),color: Colors.black,)),
                    Text("Usage",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                )),
                Container(height: 70,width: 50,child: Column(
                  children: <Widget>[
                    Tab(icon: new Icon(Icons.history,color: Colors.black,)),
                    Text("History",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                )),
                Container(height: 70,width: 50,child: Column(
                  children: <Widget>[
                    Tab(icon: new Icon(Maki.tree_1,color: Colors.black,)),
                    Text("Offset",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                )),
                Container(height: 70,width: 50,child: Column(
                  children: <Widget>[
                    Tab(icon: new Icon(Icons.lightbulb_outline,color: Colors.black,)),
                    Text("Tips",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                  ],
                )),

              ],

              onTap: (index) {},
            ),
          ),
          backgroundColor: primarycolor,
        ),
        body: TabBarView(
          children: [
            Usage(),
           history(),
           Offset(),
           tips()
          ],
        ),
      ),
    );
  }
}
