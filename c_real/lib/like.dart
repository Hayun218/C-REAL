import 'package:c_real/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'consumer.dart';
import 'create.dart';
import 'home_detail.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);
  @override
  LikePageState createState() => LikePageState();
}

class LikePageState extends State<LikePage> with TickerProviderStateMixin {
  bool _isSearchActivated = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget _home() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0, bottom: 5.0),
      child: StreamBuilder<QuerySnapshot>(
          // stream: FirebaseFirestore.instance.collectionGroup('Posts').orderBy('timeStamp', descending: true).snapshots(),
          stream: FirebaseFirestore.instance
              .collectionGroup('store')
              .orderBy('timeStamp', descending: true)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            return Container(
                height: 400,
                child: Scrollbar(
                    child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: itemWidth / itemHeight,
                  ),
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: ((context, index) => Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, left: 8.0, right: 8.0),
                      child: InkWell(
                        onTap: () => Get.to(() => HomeDetailPage(
                              pageInfo: "",
                              titleStr: snapshot.data!.docs[index]['title'],
                              explainStr: snapshot.data!.docs[index]['explain'],
                              imgURL: snapshot.data!.docs[index]['firstPicUrl'],
                              keyValue: snapshot.data!.docs[index]['key'],
                              heart: snapshot.data!.docs[index]['like'],
                              exchange: snapshot.data!.docs[index]['exchange'],
                              left: snapshot.data!.docs[index]['left'],
                              price: snapshot.data!.docs[index]['price'],
                              weight: snapshot.data!.docs[index]['weight'],
                              where: snapshot.data!.docs[index]['wherefrom'],
                              wrap: snapshot.data!.docs[index]['wraptype'],
                            )),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Material(
                                color: Colors.transparent,
                                child: AspectRatio(
                                  aspectRatio: 18.0 / 11.0,
                                  child:
                                      Image.network(snapshot.data!.docs[index]['firstPicUrl']),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    16.0, 12.0, 16.0, 8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${snapshot.data!.docs[index]['title']}, ${snapshot.data!.docs[index]['weight']}kg",
                                      style: NunitoProductTitle(),
                                    ),
                                    SizedBox(height: 4.0),
                                    Text(
                                        "${snapshot.data!.docs[index]['price']}원",
                                        style: NunitoProductPrice()),
                                    SizedBox(height: 4.0),
                                    Text(
                                        '1kg당 ${NumberFormat("###.#", "en_US").format(double.parse(snapshot.data!.docs[index]['price']) / double.parse(snapshot.data!.docs[index]['weight']))}원',
                                        style: NunitoProductSmall()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ))),
                )));
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height / 5,
        backgroundColor: Color(0xff9EC151),
        flexibleSpace: Container(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "나의 상점",
                    style: GoogleFonts.nunito(
                        color: Colors.white,
                        fontSize: 20,
                        height: 27 / 20,
                        letterSpacing: 0,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Image.asset("assets/images/myshop.png"),
            ],
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              child: Text("판매상품"),
            ),
            Tab(
              child: Text("상점후기"),
            ),
            Tab(
              child: Text("찜목록"),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
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
                      child: _home(),
                    ),
                    /*
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: fruitProductList.length,
                        itemBuilder: (context, index) {
                          return _ListViewCard(context, index);
                        },
                      ),
                    ),
                    */
                  ],
                ),
                _isSearchActivated
                    ? TextField(
                        decoration: InputDecoration(
                            labelText: '필요한 농산물을 검색해 보세요',
                            filled: true,
                            fillColor: Colors.white),
                      )
                    : Container(),
              ],
            ),
          ),
          Container(),
          Container(),
        ],
      ),

      // Container(
      //   height: MediaQuery.of(context).size.height,
      //   width: MediaQuery.of(context).size.width,
      //   child: Stack(
      //     children: [
      //       Column(
      //         children: [
      //           /*
      //           Container(
      //               padding: const EdgeInsets.only(top: 30.0),
      //               width: MediaQuery.of(context).size.width,
      //               child: DefaultTabController(length: 2, child: _tabBar)),
      //               */
      //           Expanded(
      //             child: ListView.builder(
      //               padding: EdgeInsets.all(8),
      //               itemCount: fruitProductList.length,
      //               itemBuilder: (context, index) {
      //                 return _ListViewCard(context, index);
      //               },
      //             ),
      //           ),
      //         ],
      //       ),
      //       _isSearchActivated
      //           ? TextField(
      //               decoration: InputDecoration(
      //                   labelText: '필요한 농산물을 검색해 보세요',
      //                   filled: true,
      //                   fillColor: Colors.white),
      //             )
      //           : Container(),
      //     ],
      //   ),
      // ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
            heroTag: 1,
            hoverElevation: 10,
            splashColor: Color.fromARGB(255, 174, 26, 26),
            tooltip: 'plus',
            elevation: 4,
            child: Icon(Icons.add),
            foregroundColor: Color.fromARGB(255, 34, 34, 32),
            backgroundColor: Color.fromARGB(255, 253, 254, 254),
            onPressed: () {
              // setState(() {
              // _selectedPageIndex = 3;
              // });

              Get.to(() => CreatePostPage());
            }),
      ),
    );
  }
}
