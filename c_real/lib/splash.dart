import 'dart:async';


import 'package:c_real/select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app.dart';

// import 'auth_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(Duration(seconds: 5), () {
      Get.offAll(() => Select());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          color: Color.fromARGB(255, 158, 193, 81),
          child: Center(child:                     
          Image.asset('asset/logo4x.png',width: 201,height: 200,)
),
        ),
        // CircularProgressIndicator()
      ],
    ));
  }
}
