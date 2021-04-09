import 'package:flutter/material.dart';
class containerbutton extends StatelessWidget {
 final String txt;
  final Color color;
  final Icon iocn;
  Key key;
  containerbutton({
    this.txt,
    this.iocn,
    this.color,
    this.key
});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: <Widget>[
          iocn,
          Text("$txt"),
        ],
      ),
    );
  }
}
