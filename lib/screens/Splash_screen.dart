import 'package:flutter/material.dart';
import 'package:trafficlly/constants/constants.dart';
import 'package:trafficlly/constants/strings.dart';
import 'package:trafficlly/models/intro_slider.dart';
import 'package:trafficlly/models/slide_object.dart';
import 'package:trafficlly/screens/Login_screen.dart';
class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  List<Slide> slides = new List();

  void _onDonePress() {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => login_screen(),));
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildSlidesList();
  }
  void buildSlidesList() {
    slides.add(
      new Slide(
        title: Strings.slideOneTitle,
        description: Strings.slideOneDesc,
        pathImage: Strings.slideOneImage,
        backgroundColor: Constants.slideOneColour,
      ),
    );
    slides.add(
      new Slide(
        title: Strings.slideTwoTitle,
        description: Strings.slideTwoDesc,
        pathImage: Strings.slideTwoImage,
        backgroundColor:Constants.slideTwoColour,
      ),
    );
    slides.add(
      new Slide(
        title: Strings.slideThreeTitle,
        description: Strings.slideThreeDesc,
        pathImage: Strings.slideThreeImage,
        backgroundColor:Constants.slideThreeColour,
      ),

);
}
@override
Widget build(BuildContext context) {
  return IntroSlider(
slides: slides,
    onDonePress: this._onDonePress,
onSkipPress: _onskipPress,
  );
}
  void _onskipPress() {
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => login_screen(),));
  }

}