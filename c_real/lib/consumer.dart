import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:google_fonts/google_fonts.dart';


import 'home.dart';
import 'home_detail.dart';
import 'order_list.dart';
import 'theme.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Widget _like() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.email)
          .collection("Like")
          .orderBy("timeStamp", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 0,left: 20,right: 20),
          child: Container(
                  height: 630   ,
                
            decoration: BoxDecoration(
              
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))
                                        
                  ),
            child: Scrollbar(
              child: GridView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                            onTap: () => Get.to(() => HomeDetailPage(
                              pageInfo: "",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              heart: snapshot.data!.docs[index]['like'],
                              exchange : snapshot.data!.docs[index]['exchange'],
                              left : snapshot.data!.docs[index]['left'],
                              price : snapshot.data!.docs[index]['price'],
                              weight : snapshot.data!.docs[index]['weight'],
                              where : snapshot.data!.docs[index]['wherefrom'],
                              wrap : snapshot.data!.docs[index]['wraptype'],
                            ),),
                      
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.check),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                        Text("판매처명"),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: AspectRatio(
                                            aspectRatio: 18/11,
                                            child: Image.asset("assets/images/55205930.jpg"),
                                          ),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          // Text(
                                          //   "${snapshot.data!.docs[index]['title']}, ${snapshot.data!.docs[index]['weight']}Kg",
                                          //   style: NunitoProductTitle(),
                                          // ),
                                          // SizedBox(height: 4.0),
                                          // Text('${snapshot.data!.docs[index]['price']}원',
                                          //     style: NunitoProductPrice()),
                                          // SizedBox(height: 4.0),
                                          // Text(
                                          //     '1kg당 ${snapshot.data!.docs[index]['price'] / snapshot.data!.docs[index]['weight']}원',
                                          //     style: NunitoProductSmall()),
                                          // Text(
                                          //     '1kg당 ${snapshot.data!.docs[index]['price'] / snapshot.data!.docs[index]['weight']}원',
                                          //     style: NunitoProductSmall()),
                                          Text(
                                            "${snapshot.data!.docs[index]['title']}, ${snapshot.data!.docs[index]['weight']}Kg",
                                            style: NunitoProductTitle(),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text('${snapshot.data!.docs[index]['price']}원',
                                              style: NunitoProductPrice()),
                                          SizedBox(height: 4.0),
                                          
                                          Text(
                                              '1kg당 ${int.parse(snapshot.data!.docs[index]['price']) / int.parse(snapshot.data!.docs[index]['weight'])}원',
                                              style: NunitoProductSmall()),
                                         
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 300,
                                    thickness: 2,
                                  ),
                                  Text("data"),
                                ],
                              ),
                            ),
                          ),
                      
                    )
                    ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
              ),
            ),
          ),
        );
      },
    );
  }
  
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9EC151),
        title: Text("찜한 아이템"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shopping_bag))],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: _like()
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



//////////////////////////////////////////////////////////////////////////////////






class OrderedCheck extends StatefulWidget {
  @override
  _OrderedCheckState createState() => _OrderedCheckState();
}

class _OrderedCheckState extends State<OrderedCheck> {
  // List<Widget> _buildGridCards(int count) {
  //   List<Widget> cards = List.generate(
  //     count,
  //     (int index) {
  //       return InkWell(
  //         onTap: () {
  //           // Navigator.of(context).push(
  //           //   MaterialPageRoute(
  //           //     builder: (context) => HomeDetailPage(
  //           //       product: shoppingProductList[index],
  //           //     ),
  //           //   ),
  //           // );
  //         },
  //         child: Card(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20.0)),
  //           clipBehavior: Clip.antiAlias,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Padding(
  //                 padding: const EdgeInsets.all(16.0),
  //                 child: Row(
  //                   children: [
  //                     Icon(Icons.check),
  //                     Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
  //                     Text("판매처명"),
  //                   ],
  //                 ),
  //               ),
  //               Row(
  //                 children: [
  //                   Material(
  //                     color: Colors.transparent,
  //                     child: SizedBox(
  //                       width: 100,
  //                       height: 100,
  //                       child: AspectRatio(
  //                         aspectRatio: 1,
  //                         child: Image.asset("assets/images/55205930.jpg"),
  //                       ),
  //                     ),
  //                   ),
  //                   Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[
  //                       Text(
  //                         "${shoppingProductList[index].title}, ${shoppingProductList[index].kiloWeight}Kg",
  //                         style: NunitoProductTitle(),
  //                       ),
  //                       SizedBox(height: 4.0),
  //                       Text('${shoppingProductList[index].price}원',
  //                           style: NunitoProductPrice()),
  //                       SizedBox(height: 4.0),
  //                       Text(
  //                           '1kg당 ${shoppingProductList[index].price.toInt()/shoppingProductList[index].kiloWeight.toInt()}원',
  //                           style: NunitoProductSmall()),
  //                       Text(
  //                           '1kg당 ${shoppingProductList[index].price.toInt()/shoppingProductList[index].kiloWeight.toInt()}원',
  //                           style: NunitoProductSmall()),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //               Divider(
  //                 height: 300,
  //                 thickness: 2,
  //               ),
  //               Text("data"),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //   return cards;
  // }

   Widget _basket() {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection("Users")
          .doc(FirebaseAuth.instance.currentUser?.email)
          .collection("Basket")
          .orderBy("timeStamp", descending: false)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        return Padding(
          padding: const EdgeInsets.only(top: 0,left: 20,right: 20),
          child: Container(
                  height: 630   ,
                
            decoration: BoxDecoration(
              
                    color: Color.fromARGB(255, 255, 255, 255),
                    border: Border.all(
                                      color: Color.fromARGB(255, 255, 255, 255),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13))
                                        
                  ),
            child: Scrollbar(
              child: GridView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                            onTap: () => Get.to(() => HomeDetailPage(
                              pageInfo: "",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              heart: snapshot.data!.docs[index]['like'],
                              exchange : snapshot.data!.docs[index]['exchange'],
                              left : snapshot.data!.docs[index]['left'],
                              price : snapshot.data!.docs[index]['price'],
                              weight : snapshot.data!.docs[index]['weight'],
                              where : snapshot.data!.docs[index]['wherefrom'],
                              wrap : snapshot.data!.docs[index]['wraptype'],
                            ),),
                      
                            child: Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)),
                              clipBehavior: Clip.antiAlias,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.check),
                                        Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                        Text("판매처명"),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Material(
                                        color: Colors.transparent,
                                        child: SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: AspectRatio(
                                            aspectRatio: 18/11,
                                            child: Image.asset("assets/images/55205930.jpg"),
                                          ),
                                        ),
                                      ),
                                      Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          // Text(
                                          //   "${snapshot.data!.docs[index]['title']}, ${snapshot.data!.docs[index]['weight']}Kg",
                                          //   style: NunitoProductTitle(),
                                          // ),
                                          // SizedBox(height: 4.0),
                                          // Text('${snapshot.data!.docs[index]['price']}원',
                                          //     style: NunitoProductPrice()),
                                          // SizedBox(height: 4.0),
                                          // Text(
                                          //     '1kg당 ${snapshot.data!.docs[index]['price'] / snapshot.data!.docs[index]['weight']}원',
                                          //     style: NunitoProductSmall()),
                                          // Text(
                                          //     '1kg당 ${snapshot.data!.docs[index]['price'] / snapshot.data!.docs[index]['weight']}원',
                                          //     style: NunitoProductSmall()),
                                          Text(
                                            "${snapshot.data!.docs[index]['title']}, ${snapshot.data!.docs[index]['weight'].toInt()}Kg",
                                            style: NunitoProductTitle(),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text('${snapshot.data!.docs[index]['price']}원',
                                              style: NunitoProductPrice()),
                                          SizedBox(height: 4.0),
                                          Text(
                                              '1kg당 ${int.parse(snapshot.data!.docs[index]['price']) / int.parse(snapshot.data!.docs[index]['weight'])}원',
                                              style: NunitoProductSmall()),
                                         
                                        ],
                                      ),
                                    ],
                                  ),
                                  Divider(
                                    height: 300,
                                    thickness: 2,
                                  ),
                                  Text("data"),
                                ],
                              ),
                            ),
                          ),
                      
                    )
                    ), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
              ),

            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 6;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      appBar: AppBar(
        title: Text("장바구니"),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Column(
              children: [
                /*
                    Container(
                        padding: const EdgeInsets.only(top: 30.0),
                        width: MediaQuery.of(context).size.width,
                        child: DefaultTabController(length: 2, child: _tabBar)),
                        */
                Expanded(
                  child: _basket(),
                ),
                /*
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: shoppingProductList.length,
                        itemBuilder: (context, index) {
                          return _ListViewCard(context, index);
                        },
                      ),
                    ),
                    */
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
          child: SizedBox(
        height: size.height / 8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "총 33000원",
              style: NunitoProductPrice(),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0)),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SizedBox(
                          height: size.height / 4,
                          child: Column(
                            children: [
                              Image.asset("assets/images/image16.png"),
                              Text('일반 마트보다',
                                  style: GoogleFonts.nunito(
                                      fontSize: 25,
                                      height: 30 / 25,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w700)),
                              Text('총N원',
                                  style: GoogleFonts.nunito(
                                      color: Color(0xff9EC151),
                                      fontSize: 25,
                                      height: 30 / 25,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w700)),
                              Text('더 저렴하게 구입해요',
                                  style: GoogleFonts.nunito(
                                      fontSize: 25,
                                      height: 30 / 25,
                                      letterSpacing: 0,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0)),
                            onPressed: (() {
                              Navigator.of(context, rootNavigator: true)
                                  .pop('dialog');
                              Get.toNamed('/payment-test');
                            }),
                            color: Color(0xff9EC151),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text(
                                "확인했어요",
                                style: GoogleFonts.nunito(
                                    color: Colors.white,
                                    fontSize: 20,
                                    height: 25 / 20,
                                    letterSpacing: 0,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ],
                        actionsAlignment: MainAxisAlignment.center,
                      );
                    });
              },
              color: Color(0xff9EC151),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "구매하기 (${shoppingProductList.length})",
                  style: GoogleFonts.nunito(
                      color: Colors.white,
                      fontSize: 20,
                      height: 25 / 20,
                      letterSpacing: 0,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
Future deleteData(String id) async{
try {
  await  FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.email)
      .collection("Like")
      .doc(id)
      .delete();
  }catch (e){
    print('e');
    return false;
  }
}  
