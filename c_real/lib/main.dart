import 'package:c_real/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(240, 255, 255, 255),
            titleTextStyle: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22),
            iconTheme: IconThemeData(color: Color.fromARGB(255, 28, 22, 22)),
          ),
          primarySwatch: Colors.blue
      ),
      home: SplashScreen(),
    );
  }
}
