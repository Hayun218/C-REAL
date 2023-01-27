import 'package:c_real/profile.dart';
import 'package:c_real/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'firebase_options.dart';
import 'home.dart';
import 'consumer.dart';
import 'profile.dart';

import 'screens/certification.dart';
import 'screens/certification_result.dart';
import 'screens/certification_test.dart';
import 'screens/payment.dart';
import 'screens/payment_result.dart';
import 'screens/payment_test.dart';

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
            titleTextStyle:
                TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 22),
            iconTheme: IconThemeData(color: Color.fromARGB(255, 28, 22, 22)),
          ),
          primarySwatch: Colors.green),
      home: SplashScreen(),
      initialRoute: '/home',
      routes: {
        '/profile': (context) => MyProfile(),
        '/home': (context) => HomePage(),
        // '/login': (context) => LoginPage(),
        '/payment-test': (context) => PaymentTest(),
        '/payment': (context) => Payment(),
        '/payment-result': (context) => PaymentResult(),
        '/certification-test': (context) => CertificationTest(),
        '/certification': (context) => Certification(),
        '/certification-result': (context) => CertificationResult()
      },
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic>? _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => HomePage(),
      fullscreenDialog: true,
    );
  }
}
