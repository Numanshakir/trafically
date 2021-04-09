






// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// //
//
// //
// // Future<String> signInWithGoogle() async {
// //   await Firebase.initializeApp();
// //
// //   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
// //   final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
// //
// //   final AuthCredential credential = GoogleAuthProvider.credential(
// //     accessToken: googleSignInAuthentication.accessToken,
// //     idToken: googleSignInAuthentication.idToken,
// //   );
// //
// //   final UserCredential authResult = await _auth.signInWithCredential(credential);
// //   final User user = authResult.user;
// //
// //   if (user != null) {
// //     assert(!user.isAnonymous);
// //     assert(await user.getIdToken() != null);
// //
// //     final User currentUser = _auth.currentUser;
// //     assert(user.uid == currentUser.uid);
// //
// //     print('signInWithGoogle succeeded: $user');
// //
// //     return '$user';
// //   }
// //
// //   return null;
// // }
// //
// // Future<void> signOutGoogle() async {
// //   await googleSignIn.signOut();
// //
// //   print("User Signed Out");
// // }
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// ///hkcabjbc
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:google_sign_in/google_sign_in.dart';
// //
// // final FirebaseAuth _auth = FirebaseAuth.instance;
// // final GoogleSignIn googleSignIn = GoogleSignIn();
// //
// // Future<String> signInWithGoogle() async {
// //   final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
// //   final GoogleSignInAuthentication googleSignInAuthentication =
// //   await googleSignInAccount.authentication;
// //
// //   final AuthCredential credential = GoogleAuthProvider.getCredential(
// //     accessToken: googleSignInAuthentication.accessToken,
// //     idToken: googleSignInAuthentication.idToken,
// //   );
// //
// //   final AuthResult authResult = await _auth.signInWithCredential(credential);
// //   final FirebaseUser user = authResult.user;
// // print(user.email+"--------------------------------------------------");
// //   assert(!user.isAnonymous);
// //   assert(await user.getIdToken() != null);
// //
// //   final FirebaseUser currentUser = await _auth.currentUser();
// //   assert(user.uid == currentUser.uid);
// //
// //   return 'signInWithGoogle succeeded: $user';
// // }
// //
// // void signOutGoogle() async{
// //   await googleSignIn.signOut();
// //
// //   print("User Sign Out");
// //}
// // FirebaseUser _user;
//
// final GoogleSignIn _googleSignIn = GoogleSignIn();
//
// final FirebaseAuth _auth = FirebaseAuth.instance;
//
// bool isSignIn =false;
// bool google =false;
// Future<FirebaseUser> signInWithGoogle(BuildContext context) async {
//   Scaffold.of(context).showSnackBar(new SnackBar(content: new Text("Sign in")));
//
//   final GoogleSignInAccount googleuser = await _googleSignIn.signIn();
//
//   GoogleSignInAuthentication googleauth = await googleuser.authentication;
//
//   final AuthCredential credential = GoogleAuthProvider.getCredential(
//
//     accessToken: googleauth.accessToken,
//
//     idToken: googleauth.idToken,
//
//   );
//   FirebaseUser userdetail = await _auth.signInWithCredential(credential);
//
//
//   // AuthResult authResult = await _auth.signInWithCredential(credential);
//   //
//   // _user = authResult.user;
//   //
//   // assert(!_user.isAnonymous);
//   //
//   // assert(await _user.getIdToken() != null);
//   //
//   // FirebaseUser currentUser = await _auth.currentUser();
//   //
//   // assert(_user.uid == currentUser.uid);
//   //
//   //
//   // // model.state =ViewState.Idle;
//   //
//   // print("User Name: ${_user.displayName}");
//   // print("User Email ${_user.email}");
//
// // }