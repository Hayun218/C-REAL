
import 'package:c_real/seller_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'auth.dart';
import 'consumer.dart';
import 'create.dart';
import 'order_list.dart';

double? _rating = 3.0;

class FarmerProfile extends StatefulWidget {
  @override
  _FarmerProfileState createState() => _FarmerProfileState();
}

class _FarmerProfileState extends State<FarmerProfile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.fromLTRB(50, 20, 50, 30),
        child: Column(
          children: [
            const SizedBox(height: 60),
            Stack(
              alignment: Alignment.center,
              clipBehavior: Clip.none,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  height: 200,
                  //width: 600,
                ),
                const Positioned(
                  top: -10,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                      'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
                    ),
                  ),
                ),
                SizedBox(height: 280),
                Container(
                  child: Text(
                    "맛있는 홍시네",
                    style: TextStyle(
                      fontSize: 28,
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned(
                  top: 160,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.people, color: Colors.lightGreen),
                          Text("192 Ratings"),
                        ],
                      ),
                  SizedBox(height: 5),
                  RatingBar.builder(
                    initialRating: _rating ?? 3.0,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 23,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 8),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                    _rating = rating;
                    setState(() {}); },
                  ),],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ),

                    const SizedBox(width: 30),

                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SellerListPage()),
                      ),
                      child: const Text("판매목록"),
                    ),

                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Icon(
                          Icons.shopping_bag,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(

                      onPressed: () => null,
                      //   Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //     builder: (context) => QuestionPage()),),

                      child: Text("취소/반품/교환목록"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Icon(
                          Icons.shopping_bag,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () => null,
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => CreatePostPage()),),
                      child: Text("결제수단"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Icon(
                          Icons.shopping_bag,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(
                      onPressed: () => showInfo(),
                      child: const Text("고객센터"),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.black12,
                      child: Center(
                        child: Icon(
                          Icons.clear,
                          color: Colors.green,
                          size: 20,
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    TextButton(

                      onPressed: () async {
                        if(FirebaseAuth.instance != null) {
                          await FirebaseAuth.instance.signOut();
                        }


                      },
                      child: Text("로그아웃"),
                    ),

                  ],
                ),
                SizedBox(height: 30),

              ],
            ),
          ],
        ),
      ),
    );
  }

  void showInfo() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(vertical: 270),
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text("고객센터"),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "전화번호: 054-123-1234",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "이메일: norithon@gmail.com",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "문의시간: 월-금 9:00-18:00",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text("확인")),
            ],
          );
        });
  }
}
