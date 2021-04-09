import 'package:flutter/material.dart';
import 'package:trafficlly/constants/style.dart';
class searchloc extends StatefulWidget {
  String locaddress;
searchloc(
  {
    Key key,
    this.locaddress,
}
    );
  @override
  _searchlocState createState() => _searchlocState();
}

class _searchlocState extends State<searchloc> {
List historysearch=['karachi','multan','rahim yar khan'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:Appbar_buildUserInfo(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.transparent,
        child: Column(

          children: <Widget>[
            Container(
              color: primarycolor,
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(left:8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Current Location",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.my_location,color: Colors.black,),
                    Text("   Current Location",style: TextStyle(color: Colors.black),),
                  ],
                ),
              ),
            ),
            Container(
              color: primarycolor,
              width: MediaQuery.of(context).size.width,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.fromLTRB( 8,0,8,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[

                    Text("Previous Searches",style: TextStyle(color: Colors.white),),
                    Text("Clear History",style: TextStyle(color: Colors.white),),
                  ],
                ),
              ),
            ),
            Expanded(child: Container(
              color: Colors.white,
              child: PrevoiusSearches(),
            )),
          ],
        ),

      )
    );
  }
  Widget Appbar_buildUserInfo() {
    return  AppBar(
      backgroundColor: primarycolor,
      automaticallyImplyLeading: false,
      title: Container(
        child:      TextField(
          autocorrect: true,
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.cancel,color: Colors.grey[600],),

            suffixIconConstraints: BoxConstraints(

            ),
            hintText: 'Tap to enter location',
            enabledBorder: UnderlineInputBorder(
              borderSide:BorderSide(color: Colors.transparent),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide:BorderSide(color: Colors.transparent),
            ),
          ),

        ),
        decoration: BoxDecoration(
          color: Colors.yellow[100],
          borderRadius: BorderRadius.circular(7),
        ),
        height: 30,
        width: MediaQuery.of(context).size.width*0.7,
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(17.0),
          child: GestureDetector(onTap: () {
            Navigator.pop(context);
          },child: Center(child: Text("Cancel"))),
        ),
      ],
    );
  }
  Widget PrevoiusSearches() {
    return  ListView.builder(
      itemCount: historysearch.length,
      itemBuilder: (context, index) {

        return GestureDetector(
          onTap: () {
            if(widget.locaddress=="from"){
              setState(() {
                fromlocationaddress=historysearch[index].toString();
              });
              print(widget.locaddress);
              Navigator.pop(context);

            }else if(widget.locaddress=="to"){
              setState(() {
                toloactionaddress =historysearch[index].toString();
              });
              print(widget.locaddress);
              Navigator.pop(context);
            }

          },
          child: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            height: 30,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.location_on,color: Colors.black,),
                  Text(historysearch[index].toString(),style: TextStyle(color: Colors.black),),
                ],
              ),
            ),
          ),
        );
      },

    );
  }
}
