import 'package:flutter/material.dart';
import 'home.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

//
class HomeDetailPage extends StatefulWidget {

  String pageInfo;
  String titleStr;
  String explainStr;
  String keyValue; 
  String heart;
  String imgURL;
  String exchange;
  String left ;
  String price;
  String weight;
  String where;
  String wrap ;
  
 
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
  _HomeDetailPageState createState() =>
      _HomeDetailPageState();
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
        appBar: AppBar(title: const Text("")),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(children: [
              SizedBox(
                height: 300.0,
                child: Hero(
                  tag: widget.price,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      
                      child: Image.asset(
                        widget.imgURL,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon:Icon(Icons.bookmark) ,
                      onPressed: (){
                        fireStore
                        .collection("Users")
                        .doc(FirebaseAuth.instance.currentUser?.email)
                        .collection("Like")
                        .doc(widget.keyValue)
                        .set({
                          "title":widget.titleStr,
                          "explain":widget.explainStr,
                          "key": widget.keyValue,
                          "timeStamp":DateTime.now(),
                          "price": widget.price,
                          "left" : widget.left,
                          "weight":widget.weight,
                          "wraptype":widget.wrap,
                          "wherefrom":widget.where,
                          "exchange" :widget.exchange,
                          "firstPicUrl": "",
                          // "firstPicWidth": 0,
                          // "firstPicHeight": 0,
                          "authorName":
                              FirebaseAuth.instance.currentUser?.email,
                          "like": "",
                        });
                        ScaffoldMessenger.of(context).showSnackBar( 
                            //SnackBar 구현하는법 context는 위에 BuildContext에 있는 객체를 그대로 가져오면 됨. 
                              SnackBar(
                                content: Text('찜목록에 추가가 되었습니다!'), //snack bar의 내용. icon, button같은것도 가능하다.
                                duration: Duration(seconds: 1), //올라와있는 시간
                                // action: SnackBarAction( //추가로 작업을 넣기. 버튼넣기라 생각하면 편하다.
                                //   label: 'Undo', //버튼이름
                                //   onPressed: (){}, //버튼 눌렀을때.
                                // ),
                              )
                          );
                      },
                    
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ]),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                child: Text(widget.titleStr)),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Row(
                children: [
                  Icon(
                    Icons.scale,
                    color: Theme.of(context).backgroundColor,
                    size: 25.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("${widget.weight}kg"),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
              child: Row(
                children: [
                  Icon(
                    Icons.attach_money,
                    color: Theme.of(context).backgroundColor,
                    size: 25.0,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("${widget.price}원"),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 8)),
            Divider(
              height: 1.0,
              thickness: 1.0,
              indent: 10,
              endIndent: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(
                "${widget.price}",
                softWrap: true,
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: MaterialButton(
            onPressed: (() {
              fireStore
                        .collection("Users")
                        .doc(FirebaseAuth.instance.currentUser?.email)
                        .collection("Basket")
                        .doc(widget.keyValue)
                        .set({
                          "title":widget.titleStr,
                          "explain":widget.explainStr,
                          "key": widget.keyValue,
                          "timeStamp":DateTime.now(),
                          "price": widget.price,
                          "left" : widget.left,
                          "weight":widget.weight,
                          "wraptype":widget.wrap,
                          "wherefrom":widget.where,
                          "exchange" :widget.exchange,
                          "firstPicUrl": "",
                          // "firstPicWidth": 0,
                          // "firstPicHeight": 0,
                          "authorName":
                              FirebaseAuth.instance.currentUser?.email,
                          "like": "",
                        });
                        ScaffoldMessenger.of(context).showSnackBar( 
                            //SnackBar 구현하는법 context는 위에 BuildContext에 있는 객체를 그대로 가져오면 됨. 
                              SnackBar(
                                content: Text('장바구니에 추가가 되었습니다!'), //snack bar의 내용. icon, button같은것도 가능하다.
                                duration: Duration(seconds: 1), //올라와있는 시간
                                // action: SnackBarAction( //추가로 작업을 넣기. 버튼넣기라 생각하면 편하다.
                                //   label: 'Undo', //버튼이름
                                //   onPressed: (){}, //버튼 눌렀을때.
                                // ),
                              )
                          );
            }),
            child: Text("장바구니에 담기"),
          ),
        ));
  }
}
