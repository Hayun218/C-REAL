import 'package:c_real/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:flutter/src/foundation/key.dart';
import 'bottom.dart';

class App extends StatelessWidget {
  App({super.key});

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: const [
              EmailProviderConfiguration(),
              //  GoogleProviderConfiguration(
              //   clientId: "852473898717-0kdn4itmvbc1bpie97tagqtqa33jvml5.apps.googleusercontent.com"
              //  ),
            ],
            //  headerBuilder: (context, constraints, shrinkOffset) {
            //    return Padding(
            //      padding: const EdgeInsets.all(20),
            //      child: AspectRatio(
            //        aspectRatio: 1,
            //        child: Image.asset('flutterfire_300x.png'),
            //      ),
            //    );
            //  },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to FlutterFire, please sign in!')
                    : const Text('Welcome to Flutterfire, please sign up!'),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            //  sideBuilder: (context, shrinkOffset) {
            //    return Padding(
            //      padding: const EdgeInsets.all(20),
            //      child: AspectRatio(
            //        aspectRatio: 1,
            //        child: Image.asset('flutterfire_300x.png'),
            //      ),
            //    );
            //  },
          );
        } else {
          fireStore
              .collection("Users")
              .doc(FirebaseAuth.instance.currentUser?.email)
              .set({
            "userID": FirebaseAuth.instance.currentUser?.email,

            "isSellor": 0,

            // "Name": FirebaseAuth.instance.currentUser?.displayName,
          });

          return BottomScreen();
        }
      },
    );
  }
}

class App1 extends StatelessWidget {
  App1({super.key});

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: const [
              EmailProviderConfiguration(),
              //  GoogleProviderConfiguration(
              //   clientId: "852473898717-0kdn4itmvbc1bpie97tagqtqa33jvml5.apps.googleusercontent.com"
              //  ),
            ],
            //  headerBuilder: (context, constraints, shrinkOffset) {
            //    return Padding(
            //      padding: const EdgeInsets.all(20),
            //      child: AspectRatio(
            //        aspectRatio: 1,
            //        child: Image.asset('flutterfire_300x.png'),
            //      ),
            //    );
            //  },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to FlutterFire, please sign in!')
                    : const Text('Welcome to Flutterfire, please sign up!'),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            //  sideBuilder: (context, shrinkOffset) {
            //    return Padding(
            //      padding: const EdgeInsets.all(20),
            //      child: AspectRatio(
            //        aspectRatio: 1,
            //        child: Image.asset('flutterfire_300x.png'),
            //      ),
            //    );
            //  },
          );
        } else {
          fireStore
              .collection("Farmer")
              .doc(FirebaseAuth.instance.currentUser?.email)
              .set({
            "userID": FirebaseAuth.instance.currentUser?.email,
            "isSellor": 1,
            // "Name": FirebaseAuth.instance.currentUser?.displayName,
          });

          return BottomScreen1();
        }
      },
    );
  }
}
