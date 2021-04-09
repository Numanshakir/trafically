import 'package:flutter/material.dart';
import 'package:trafficlly/constants/style.dart';
import 'package:trafficlly/data/User.dart';
import 'package:trafficlly/screens/DashboardPage.dart';
import 'package:trafficlly/screens/RouteSearchPage.dart';
import 'package:trafficlly/screens/SettingsPage.dart';
class home_screen extends StatefulWidget {

Key key;
User user=User();
home_screen({
  this.user,
  this.key,
});
  @override
  _home_screenState createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  int currentTab=0;
  final List<Widget> screens = [
    RouteSearchPage(),
    SettingsPage(),
    DashboardPage(),
  ];
  @override
  void initState() {
    // TODO: implement initState
setState(() {
  userphotoUrl=widget.user.photoUrl;
  userdisplayName=widget.user.displayName;
  useremail=widget.user.email;
});

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  IndexedStack(
        children: screens,
        index: currentTab,
      ),
        bottomNavigationBar:_buildBottomNavigation(),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.place,color: Colors.black,),
        backgroundColor:primarycolor ,
        onPressed: () {

          _changePage(0);
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      resizeToAvoidBottomInset: false,
      extendBody: true,

    );
  }
  Widget _buildBottomNavigation() {
    return BottomAppBar(

      shape: CircularNotchedRectangle(),
      notchMargin: 12,
      child: Container(
        padding: EdgeInsets.only(left: 25, right: 20),
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                _changePage(1);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.settings,
                    color: currentTab == 1
                        ? primarycolor
                        : Colors.grey,
                  ),
                  Text(
                    'Settings',
                    style: TextStyle(
                      color: currentTab == 1
                          ? primarycolor
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            MaterialButton(
              minWidth: 40,
              onPressed: () {
                _changePage(2);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.dashboard,
                    color: currentTab == 2
                        ? primarycolor
                        : Colors.grey,
                  ),
                  Text(
                    'Dashboard',
                    style: TextStyle(
                      color: currentTab == 2
                          ?primarycolor
                          :Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  void _changePage(int pageIndex) {
    setState(() {
      currentTab = pageIndex;
      print(currentTab);
    });
  }
}
