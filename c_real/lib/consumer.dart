import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("즐겨찾기 관리"),
      ),
      body: Container(
        child: TextButton(
          onPressed: FirebaseAuth.instance.signOut,
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            primary: Color.fromARGB(255, 27, 26, 26),
          ),
          child: const Text("로그아웃"),
        ),
      ),
    );
  }
}

class OrderedCheck extends StatefulWidget {
  @override
  _OrderedCheckState createState() => _OrderedCheckState();
}

class _OrderedCheckState extends State<OrderedCheck> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("주문내역"),
      ),
    );
  }
}
