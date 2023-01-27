import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consumer.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'star_count.dart';

//
class HomeDetailPage extends StatefulWidget {
  String pageInfo;
  String titleStr;
  String explainStr;
  String keyValue;
  String heart;
  String imgURL;
  String exchange;
  String left;
  String price;
  String weight;
  String where;
  String wrap;

  HomeDetailPage(
      {Key? key,
      required this.pageInfo,
      required this.titleStr,
      required this.explainStr,
      required this.keyValue,
      required this.heart,
      required this.exchange,
      required this.left,
      required this.price,
      required this.weight,
      required this.where,
      required this.wrap,
      this.imgURL = ''})
      : super(key: key);
  @override
  _HomeDetailPageState createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  Future<bool> onLikeButtonTapped(bool isLiked) async {
    fireStore
        .collection("Users")
        .doc(FirebaseAuth.instance.currentUser?.email)
        .collection("Like")
        .doc(widget.keyValue)
        .set({
      "key": widget.keyValue,
      "timeStamp": DateTime.now(),
    });
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("상세페이지",
              style: GoogleFonts.nunito(
                  color: Colors.black,
                  fontSize: 18,
                  height: 25 / 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.w600)),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrderedCheck(),
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_bag,
                color: Color(0xff9EC151),
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300.0,
              child: Hero(
                tag: widget.price,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    child: Image.asset("assets/images/55205930.jpg"),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "농가 소득의 20%가 상승해요!",
                    style: GoogleFonts.nunito(
                        color: Color(0xff9EC151),
                        fontSize: 14,
                        height: 19 / 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700),
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite, size: 40),
                    onPressed: () {
                      fireStore
                          .collection("Users")
                          .doc(FirebaseAuth.instance.currentUser?.email)
                          .collection("Like")
                          .doc(widget.keyValue)
                          .set({
                        "title": widget.titleStr,
                        "explain": widget.explainStr,
                        "key": widget.keyValue,
                        "timeStamp": DateTime.now(),
                        "price": widget.price,
                        "left": widget.left,
                        "weight": widget.weight,
                        "wraptype": widget.wrap,
                        "wherefrom": widget.where,
                        "exchange": widget.exchange,
                        "firstPicUrl": "",
                        // "firstPicWidth": 0,
                        // "firstPicHeight": 0,
                        "authorName": FirebaseAuth.instance.currentUser?.email,
                        "like": "",
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                          //SnackBar 구현하는법 context는 위에 BuildContext에 있는 객체를 그대로 가져오면 됨.
                          SnackBar(
                        content: Text(
                            '찜목록에 추가가 되었습니다!'), //snack bar의 내용. icon, button같은것도 가능하다.
                        duration: Duration(seconds: 1), //올라와있는 시간
                        // action: SnackBarAction( //추가로 작업을 넣기. 버튼넣기라 생각하면 편하다.
                        //   label: 'Undo', //버튼이름
                        //   onPressed: (){}, //버튼 눌렀을때.
                        // ),
                      ));
                    },
                    color: Colors.red,
                  ),
                ],
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
                child: Text(
                  "${widget.titleStr}, ${widget.weight}Kg",
                  style: GoogleFonts.nunito(
                      fontSize: 24,
                      height: 33 / 24,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700),
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Row(
                children: [
                  StarCount(starNum: 4, size: 25),
                  Padding(padding: EdgeInsets.symmetric(horizontal: 8)),
                  Text(
                    "3.4",
                    style: GoogleFonts.nunito(
                        color: Color(0xff9EC151),
                        fontSize: 14,
                        height: 19 / 14,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "15%할인",
                    style: GoogleFonts.nunito(
                        color: Color(0xffF09E00),
                        fontSize: 20,
                        height: 30 / 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${widget.price}원",
                    style: GoogleFonts.nunito(
                        fontSize: 24,
                        height: 30 / 24,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 8)),
            Divider(
              height: 1.0,
              thickness: 2.0,
              indent: 10,
              endIndent: 10,
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  minWidth: 175,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {
                    fireStore
                        .collection("Users")
                        .doc(FirebaseAuth.instance.currentUser?.email)
                        .collection("Basket")
                        .doc(widget.keyValue)
                        .set({
                      "title": widget.titleStr,
                      "explain": widget.explainStr,
                      "key": widget.keyValue,
                      "timeStamp": DateTime.now(),
                      "price": widget.price,
                      "left": widget.left,
                      "weight": widget.weight,
                      "wraptype": widget.wrap,
                      "wherefrom": widget.where,
                      "exchange": widget.exchange,
                      "firstPicUrl": "",
                      // "firstPicWidth": 0,
                      // "firstPicHeight": 0,
                      "authorName": FirebaseAuth.instance.currentUser?.email,
                      "like": "",
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                        //SnackBar 구현하는법 context는 위에 BuildContext에 있는 객체를 그대로 가져오면 됨.
                        SnackBar(
                      content: Text(
                          '장바구니에 추가가 되었습니다!'), //snack bar의 내용. icon, button같은것도 가능하다.
                      duration: Duration(seconds: 1), //올라와있는 시간
                      // action: SnackBarAction( //추가로 작업을 넣기. 버튼넣기라 생각하면 편하다.
                      //   label: 'Undo', //버튼이름
                      //   onPressed: (){}, //버튼 눌렀을때.
                      // ),
                    ));
                  },
                  color: Color(0xff9EC151),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "장바구니에 담기",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 14,
                          height: 19 / 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                MaterialButton(
                  minWidth: 175,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  onPressed: () {},
                  color: Color(0xff325920),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "바로 구입하기",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 14,
                          height: 19 / 14,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
