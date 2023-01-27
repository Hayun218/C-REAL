import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ComPage extends StatefulWidget {
  @override
  _ComPageState createState() => _ComPageState();
}

class _ComPageState extends State<ComPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
            onPressed: FirebaseAuth.instance.signOut,
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              primary: Color.fromARGB(255, 27, 26, 26),
            ),
            child: const Text("로그아웃"),
          ),
    );
  }
}
