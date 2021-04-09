

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trafficlly/data/User.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as JSON;

import 'package:trafficlly/screens/home_screen.dart';
import 'package:trafficlly/screens/signin/SignIn_screen.dart';

class login_screen extends StatefulWidget {
  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
Key key;
GlobalKey<FormState> _userLoginFormKey = GlobalKey();
bool _isLoggedIn = false;
Map userProfile=new Map();
final facebookLogin = FacebookLogin();

_loginWithFB() async{

  User detail = User();
  final result = await facebookLogin.logInWithReadPermissions(['email']);

  switch (result.status) {
    case FacebookLoginStatus.loggedIn:
      final token = result.accessToken.token;
      final graphResponse = await http.get('https://graph.facebook.com/v2.12/me?fields=name,picture,email&access_token=${token}');
      final profile = JSON.jsonDecode(graphResponse.body);
      print(profile+"====================");
      setState(() {
        userProfile = profile;
        _isLoggedIn = true;
        detail.setdata(userProfile[0],userProfile[1], userProfile[2], " ", List());
      });
      break;

    case FacebookLoginStatus.cancelledByUser:
      setState(() => _isLoggedIn = false );
      break;
    case FacebookLoginStatus.error:
      setState(() => _isLoggedIn = false );
      break;

  }


  Navigator.push(context, MaterialPageRoute(builder: (context) => home_screen(user: detail,),));
}

_logout(){
  facebookLogin.logOut();
  setState(() {
    _isLoggedIn = false;
  });
}
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Stack(
        children: <Widget>[
          Form(
            key: _userLoginFormKey,
            child: Container(

              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,

              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/background.jpg"),fit: BoxFit.cover)
              ),


            ),
          ),
          Positioned(
            top: 180,
            child: Container(
              height:  60,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/trafficly-logo.png"))
              ),


            ),
          ),
          Positioned(top: 300,left: 30,
            child:  GestureDetector(
              onTap: () => signInWithGoogle().then((FirebaseUser user) => print(user)).catchError((e)=>print(e)),
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(

                  children: <Widget>[

                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(padding: EdgeInsets.only(left: 10),width: 40,height: 40,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/go-logo.png"))),),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text("Sign in with Google"),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(top: 370,left: 30,
            child: GestureDetector
              (
              onTap: () => _loginWithFB(),
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.blue[600],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(

                  children: <Widget>[

                   Padding(
                     padding: const EdgeInsets.all(10.0),
                     child: Container(padding: EdgeInsets.only(left: 10),width: 40,height: 40,decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/fb-logo.png"))),),
                   ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text("Sign in with Facebook",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(top: 440,left: 30,
            child:  Container(
              height: 20,
              width: 300,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
Container(height: 4,width: 100,decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(2)),),
                    Text("  or  ",style: TextStyle(color: Colors.white),),
Container(height: 4,width: 100,decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(2)),),

                  ],
                ),
              ),
            ),
          ),
          Positioned(top: 470,left: 30,
            child:  GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SignIn(),));
              },
              child: Container(
                height: 55,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.teal  ,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(

                  children: <Widget>[


                    Padding(
                      padding: const EdgeInsets.only(left: 35),
                      child: Text("Sign in with E-mail and Password",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
// Future<DocumentSnapshot> getData() async {
//   await Firebase.initializeApp();
//   return await FirebaseFirestore.instance
//       .collection("users")
//       .doc("dnxuwmf355DWfHuMp0OZULOcYlAS2")
//       .get();
// }
//   printdata()async{
//     await Firestore.instance.collection("users").document("nxuwmf355DWfHuMp0OZULOcYlAS2").get().then((value) =>{
//       print(value.data["email"]+" 0000000000000000000000"),
//     });
//   }



//
final GoogleSignIn _googleSignIn = GoogleSignIn();

final FirebaseAuth _auth = FirebaseAuth.instance;

bool isSignIn =false;
bool google =false;
Future<FirebaseUser> signInWithGoogle() async {
  // Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Sign in")));

  final GoogleSignInAccount googleuser = await _googleSignIn.signIn();

  GoogleSignInAuthentication googleauth = await googleuser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(

    accessToken: googleauth.accessToken,

    idToken: googleauth.idToken,

  );
  var userdetail = await _auth.signInWithCredential(credential);
  ProviderDetails proverinfo = ProviderDetails(userdetail.user.providerData);
  List<ProviderDetails> providerdata = List<ProviderDetails>();
  providerdata.add(proverinfo);
  User detail = User();
  detail.setdata(userdetail.user.photoUrl,userdetail.user.displayName, userdetail.user.email," ",providerdata,);

  print(detail.displayName);
  print(detail.email);
  print(detail.photoUrl);
  print(detail.providerDetails);

  Navigator.push(context, MaterialPageRoute(builder: (context) => home_screen(user: detail,key: key,),));
  // AuthResult authResult = await _auth.signInWithCredential(credential);
  //
  // _user = authResult.user;
  //
  // assert(!_user.isAnonymous);
  //
  // assert(await _user.getIdToken() != null);
  //
  // FirebaseUser currentUser = await _auth.currentUser();
  //
  // assert(_user.uid == currentUser.uid);
  //
  //
  // // model.state =ViewState.Idle;
  //
  // print("User Name: ${_user.displayName}");
  // print("User Email ${_user.email}");

// }
}
}
