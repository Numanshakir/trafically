import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trafficlly/constants/style.dart';
import 'package:trafficlly/data/User.dart';
import 'package:trafficlly/screens/home_screen.dart';
import 'package:trafficlly/screens/signin/googlesignin.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success=false;
  String _userEmail;
  User _user=User();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                color: Colors.transparent,
                height: 100,
                width: 160,
                child: Image(
                  image: AssetImage("assets/trafficly-logo-placeholder.png"),
                  color: Colors.white,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.78,
                height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text(
                      "E-mail",
                      style: TextStyle(color: Colors.black,fontSize: 10),
                    ),
                            Container(
                              height: 50,
                              width: 220,
                              color: Colors.transparent,
                              child: TextFormField(

                                inputFormatters: [

                                  BlacklistingTextInputFormatter
                                      .singleLineFormatter,
                                ],
                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },

                                controller: _emailController,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                                 border: OutlineInputBorder(
                                borderSide: BorderSide(
                                color: Colors.black,
                                  width: 2,
                                ),

                              ),

                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primarycolor,
                                        width: 2,
                                      )
                                  )


                                ),

                              ),
                            )
                          ],
                        ),
                      width: MediaQuery.of(context).size.width * 0.74,
                      height: 40,
                      color: Colors.transparent,
                    ),
                    Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                      "Password",
                      style: TextStyle(color: Colors.black),
                    ),
                            Container(
                              height: 40,
                              width: 160,
                              color: Colors.transparent,
                              child: TextFormField(

                                validator: (String value) {
                                  if (value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                controller: _passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                 border: OutlineInputBorder(
                                borderSide: BorderSide(
                                color: Colors.black,
                                  width: 2,
                                )
                              ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: primarycolor,
                                        width: 2,
                                      )
                                  )


                                ),

                              ),
                            )
                          ],
                        ),
                      width: MediaQuery.of(context).size.width * 0.74,
                      height: 40,
                      color: Colors.transparent,
                    ),
                    RaisedButton(
                      onPressed: () {
                     _register(context);
print(_userEmail);
                      },
                      color: primarycolor,
                      child: Text("Sign In",style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                    ),

                  ],
                ),
              ),

              SizedBox(height: 10,),
              Container(
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
                      Text("  or Use  ",style: TextStyle(color: Colors.white),),
                      Container(height: 4,width: 100,decoration: BoxDecoration( color: Colors.white,borderRadius: BorderRadius.circular(2)),),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: MediaQuery.of(context).size.width * 0.74,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      height: 50,
                      width: 50,
                      child: Image(
                        image: AssetImage("assets/fb-logo.png"),color: Colors.blue,
                      ),
                    ),

                    Container(
                      height: 40,
                      width: 40,

                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(image: AssetImage("assets/go-logo.png"),fit: BoxFit.cover),
                      ),
                    ),

                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
  void _register(BuildContext context) async {
    final FirebaseUser user = (await
    _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
    ).user;

    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;

        _user.setdata(user.photoUrl, user.displayName, user.email, " ", List());
        Navigator.push(context,MaterialPageRoute(builder: (context) => home_screen(user: _user,),));
      });

    } else {
      setState(() {
        _success = true;
      });
    }

  }
}
