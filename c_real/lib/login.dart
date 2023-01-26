// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_ui_auth/firebase_ui_auth.dart';
// import 'package:firebase_ui_firestore/firebase_ui_firestore.dart';
// class Authentication extends StatelessWidget {
//   const Authentication({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (context,snapshot){
//           if(!snapshot.hasData){
//             return SignInScreen(
//               providers: [
//                 EmailProviderConfiguration(),
//               ],
//             );
//           }
//         }
//     );
//   }
// }

