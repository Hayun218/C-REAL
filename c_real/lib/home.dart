import 'package:c_real/home_detail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'consumer.dart';
import 'theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

int pageChanged = 0;

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    var path = Path();
    path.lineTo(0, height - 50);
    path.quadraticBezierTo(width / 2, height, width, height - 50);
    path.lineTo(width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _isSearchActivated = false;
  late TabController _tabController;

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
              .collectionGroup('posts')
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
                                      Image.asset("assets/images/55205930.jpg"),
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

  Widget _home1() {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
    return Padding(
      padding:
          const EdgeInsets.only(top: 15.0, left: 8.0, right: 8.0, bottom: 5.0),
      child: StreamBuilder<QuerySnapshot>(
          // stream: FirebaseFirestore.instance.collectionGroup('Posts').orderBy('timeStamp', descending: true).snapshots(),
          stream: FirebaseFirestore.instance
              .collectionGroup('postsa')
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
                                      Image.asset("assets/images/55205930.jpg"),
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
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  // List<Widget> _buildGridCards(int count) {
  //   List<Widget> cards = List.generate(
  //     count,
  //     (int index) {
  //       return InkWell(
  //         onTap: () {
  //           Navigator.of(context).push(
  //             MaterialPageRoute(
  //               builder: (context) => HomeDetailPage(
  //                 product: fruitProductList[index],
  //               ),
  //             ),
  //           );
  //         },
  //         child: Card(
  //           shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(20.0)),
  //           clipBehavior: Clip.antiAlias,
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: <Widget>[
  //               Hero(
  //                 tag: fruitProductList[index].price,
  //                 child: Material(
  //                   color: Colors.transparent,
  //                   child: AspectRatio(
  //                     aspectRatio: 18.0 / 11.0,
  //                     child: Image.asset("assets/images/55205930.jpg"),
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
  //                 child: Column(
  //                   crossAxisAlignment: CrossAxisAlignment.start,
  //                   children: <Widget>[
  //                     Text(
  //                       "${fruitProductList[index].title}, ${fruitProductList[index].kiloWeight}Kg",
  //                       style: NunitoProductTitle(),
  //                     ),
  //                     SizedBox(height: 4.0),
  //                     Text('${fruitProductList[index].price}원',
  //                         style: NunitoProductPrice()),
  //                     SizedBox(height: 4.0),
  //                     Text(
  //                         '1kg당 ${fruitProductList[index].price / fruitProductList[index].kiloWeight}원',
  //                         style: NunitoProductSmall()),
  //                   ],
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  //   return cards;
  // }

  Widget _ListViewCard(BuildContext context, int index) {
    return Card(
      child: InkWell(
        onTap: () {
          // Navigator.of(context).push(
          //   MaterialPageRoute(
          //     builder: (context) => HomeDetailPage(
          //       product: fruitProductList[index],
          //     ),
          //   ),
          // );
        },
        child: ListTile(
          leading: Material(
            color: Colors.transparent,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.asset("assets/images/55205930.jpg"),
            ),
          ),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // StarCount(starNum: product.starCount, size: 10),
              Text(
                fruitProductList[index].title,
                style: NunitoProductTitle(),
              ),
            ],
          ),
          subtitle: Text(
            "${fruitProductList[index].kiloWeight}kg",
            style: NunitoProductKiloweight(),
          ),
          trailing: Text(
            "${fruitProductList[index].price}원",
            style: NunitoProductPrice(),
          ),
          isThreeLine: true,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = size.height / 3;
    final double itemWidth = size.width / 2;
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: size.height / 8,
          backgroundColor: Color(0xff9EC151),
          flexibleSpace: Container(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset("assets/images/Group151.png"),
                    Text(
                      "메인화면",
                      style: GoogleFonts.nunito(
                          color: Colors.white,
                          fontSize: 20,
                          height: 27 / 20,
                          letterSpacing: 0,
                          fontWeight: FontWeight.w500),
                    ),
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
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)),
                        prefixIcon: Icon(Icons.search),
                        hintText: '어떤 농산물을 찾으세요?',
                        hintStyle: GoogleFonts.nunito(
                            color: Color(0xff9EC151),
                            fontSize: 14,
                            height: 19 / 13,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500),
                        filled: true,
                        fillColor: Colors.white),
                  ),
                )
              ],
            ),
          ),
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                child: Text("채소"),
              ),
              Tab(
                child: Text("과일"),
              ),
            ],
          ),
        ),

        // appBar: AppBar(
        //   backgroundColor: Color(0xff9EC151),
        //   actions: [
        //     IconButton(
        //       onPressed: () {
        //         setState(() {
        //           _isSearchActivated = !_isSearchActivated;
        //         });
        //       },
        //       icon: Icon(Icons.search),
        //     ),
        //     IconButton(onPressed: () {}, icon: Icon(Icons.logout_rounded)),
        //     IconButton(
        //       onPressed: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => FavoritePage(),
        //           ),
        //         );
        //       },
        //       icon: Icon(Icons.star),
        //     ),
        //     IconButton(
        //       onPressed: () {
        //         Navigator.of(context).push(
        //           MaterialPageRoute(
        //             builder: (context) => OrderedCheck(),
        //           ),
        //         );
        //       },
        //       icon: Icon(Icons.shopping_bag),
        //     )
        //   ],
        //   bottom: TabBar(
        //     controller: _tabController,
        //     tabs: const <Widget>[
        //       Tab(
        //         child: Text("과일"),
        //       ),
        //       Tab(
        //         child: Text("야채"),
        //       ),
        //     ],
        //   ),
        // ),
        body: TabBarView(controller: _tabController, children: [
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
                      child: _home1(),
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
        ]));
  }
}

class Product {
  Product({
    required this.imagePath,
    required this.price,
    required this.title,
    required this.kiloWeight,
    bool isFavorited = false,
  });
  final String imagePath;
  final int price;
  final String title;
  final int kiloWeight;
  bool isFavorited = false;
}

List<Product> fruitProductList = [
  Product(
    imagePath: 'assets/images/55205930.jpg',
    price: 10,
    title: 'title1',
    kiloWeight: 1,
  ),
  Product(
    imagePath: 'assets/images/55205930.jpg',
    price: 11,
    title: 'title2',
    kiloWeight: 1,
  ),
  Product(
    imagePath: 'assets/images/55205930.jpg',
    price: 12,
    title: 'title3',
    kiloWeight: 1,
  ),
  Product(
    imagePath: 'assets/images/55205930.jpg',
    price: 3,
    title: 'title4',
    kiloWeight: 1,
  ),
  Product(
    imagePath: 'assets/images/55205930.jpg',
    price: 14,
    title: 'title5',
    kiloWeight: 1,
  ),
  Product(
    imagePath: 'assets/images/55205930.jpg',
    price: 15,
    title: 'title6',
    kiloWeight: 1,
  ),
  Product(
    imagePath: 'assets/images/55205930.jpg',
    price: 16,
    title: 'title7',
    kiloWeight: 1,
  ),
  Product(
    imagePath: 'assets/images/55205930.jpg',
    price: 17,
    title: 'title8',
    kiloWeight: 1,
  ),
];
List<Product> favoriteProductList = [];

List<Product> shoppingProductList = [];
