import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trafficlly/common_widgets/avatar.dart';
import 'package:trafficlly/constants/settingsvalue.dart';
import 'package:trafficlly/constants/style.dart';
import 'package:trafficlly/data/User.dart';
import 'package:trafficlly/screens/Login_screen.dart';

class SettingsPage extends StatefulWidget {
  Key key;

  SettingsPage({

   this.key,
});
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int i = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: Text("Settings"),
        ),
        body: Container(
          child: Column(
            children: <Widget>[
              SettingsTile1("VEHICLE"),
              Divider(
                color: Colors.grey,
              ),
              SettingsTile2("UNITS"),
              Divider(
                color: Colors.grey,
              ),
              SettingsTile3("ACCOUNT"),
            ],
          ),
        ));
  }

  Widget SettingsTile1(String tile) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.22,
      color: Colors.transparent,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text(
              tile,
              style: TextStyle(color: primarycolor),
            ),
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Fuel Type",style: TextStyle(color: primarycolor)),
                        content: Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: 200,
                                height: 30,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("Petrol"),
                                    Radio(
                                      value: "Petrol",
                                      groupValue: values,
                                      onChanged: (value) {
                                        setState(() {
                                          values = value;
                                        });
                                        // Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                width: 200,
                                height: 30,
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Text("Desel"),
                                    Radio(
                                      value: "Desel",
                                      groupValue: values,
                                      onChanged: (value) {
                                        setState(() {
                                          values = value;
                                        });
                                        // Navigator.pop(context);
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              'cancel',
                              style: TextStyle(
                                  color: Theme.of(context).disabledColor),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('ok',style: TextStyle(color: primarycolor)),
                            onPressed: () {
                              setState(() {
                                fueltype=values;
                              });

                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: SettingsTiledata(
                    "Fuel Type", fueltype, Icons.local_gas_station)),
            Divider(
              color: Colors.grey,
            ),
            GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Fuel Consumption",style: TextStyle(color: primarycolor)),
                        content: TextField(
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            values=value;
                          },
                          decoration: InputDecoration(

                          ),
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text(
                              'cancel',
                              style: TextStyle(
                                  color: Theme.of(context).disabledColor),
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          FlatButton(
                            child: Text('ok',style: TextStyle(color: primarycolor)),
                            onPressed: () {
                              fuelConsumetion=values;
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: SettingsTiledata("Fuel Consumption", fuelConsumetion,
                    Icons.local_gas_station)),
          ],
        ),
      ),
    );
  }

  Widget SettingsTile2(String tile) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.31,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            tile,
            style: TextStyle(color: primarycolor),
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Distance",style: TextStyle(color: primarycolor)),
                      content: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 200,
                              height: 30,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text("Miles"),
                                  Radio(
                                    value: "Miles",
                                    groupValue: values,
                                    onChanged: (value) {
                                      setState(() {
                                        values = value;
                                      });
                                      // Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 30,
                              color: Colors.transparent,
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Text("KiloMeter"),
                                  Radio(
                                    value: "KiloMiter",
                                    groupValue: values,
                                    onChanged: (value) {
                                      setState(() {
                                        values = value;
                                      });
                                      // Navigator.pop(context);
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            'cancel',
                            style: TextStyle(
                                color: Theme.of(context).disabledColor),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('ok',style: TextStyle(color: primarycolor)),
                          onPressed: () {
                            distance=values;
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: SettingsTiledata("Distance", distance, Icons.directions)),
          Divider(
            color: Colors.grey,
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Speed",style: TextStyle(color: primarycolor)),
                      content: TextField(
                      keyboardType: TextInputType.number ,
                        onChanged: (value) {

                          values=value;
                        },
                        decoration: InputDecoration(


                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            'cancel',
                            style: TextStyle(
                                color: Theme.of(context).disabledColor),
                          ),
                          onPressed: () {

                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('ok',style: TextStyle(color: primarycolor)),
                          onPressed: () {
                            speed=values;
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: SettingsTiledata("Speed", speed, Icons.shutter_speed)),
          Divider(
            color: Colors.grey,
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text("Fuel",style: TextStyle(color: primarycolor)),
                      content: Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          width: 200,
                          height: 30,
                          color: Colors.transparent,
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text("PMG",),
                              Radio(
                                value: "PMG",
                                groupValue: values,
                                onChanged: (value) {
                                  setState(() {
                                    values = value;
                                  });
                                  // Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                      actions: <Widget>[
                        FlatButton(
                          child: Text(
                            'cancel',
                            style: TextStyle(
                                color: Theme.of(context).disabledColor),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        FlatButton(
                          child: Text('ok',style: TextStyle(color: primarycolor),),
                          onPressed: () {
                            fuel=values;
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              },
              child: SettingsTiledata("Fuel", fuel, Icons.local_gas_station)),
        ],
      ),
    );
  }

  Widget SettingsTile3(String tile) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.26,
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Text(
            tile,
            style: TextStyle(color: primarycolor),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                _buildUserInfo(),
                SizedBox(height: 10,),
                GestureDetector(
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.exit_to_app,
                        color: primarycolor,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 30),
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  onTap: () {
                     _confirmSignOut(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget SettingsTiledata(String datatext, String value, IconData icon) {
    return Container(
      height: 55,
      width: MediaQuery.of(context).size.width,
      color: Colors.transparent,
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Icon(icon),
          Expanded(
              child: Container(
            padding: EdgeInsets.only(left: 30),
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  datatext,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  "$value",
                  style: TextStyle(color: Colors.grey[500]),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
  Widget _buildUserInfo() {
    return Row(
      children: [
        Avatar(
          photoUrl: userphotoUrl,
          radius: 15,
          borderColor: Colors.black54,
          borderWidth: 2.0,
        ),
        SizedBox(width: 20),
        Text(
          userdisplayName ?? useremail ?? "Anonymous User",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        SizedBox(height: 8),
      ],
    );
  }
  _confirmSignOut(BuildContext context){
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Logout Account",style: TextStyle(color: primarycolor),),
          content: Text("Are You sure to Logout?"),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'cancel',
                style: TextStyle(
                    color: Theme.of(context).disabledColor),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('ok',style: TextStyle(color: primarycolor),),
              onPressed: () {
                fuel=values;
                Navigator.pushReplacement(context,  MaterialPageRoute(builder: (context) => login_screen(),));
              },
            ),
          ],
        );
      },
    );
  }
}
