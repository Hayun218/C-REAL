import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

import 'home.dart';
import 'home_detail.dart';
import 'order_list.dart';
import 'theme.dart';

class FavoritePage extends StatefulWidget {
  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Widget> _buildGridCards(int count) {
    List<Widget> cards = List.generate(
      count,
      (int index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(
                  product: favoriteProductList[index],
                ),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            clipBehavior: Clip.antiAlias,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Material(
                  color: Colors.transparent,
                  child: AspectRatio(
                    aspectRatio: 18.0 / 11.0,
                    child: Image.asset("assets/images/55205930.jpg"),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${favoriteProductList[index].title}, ${favoriteProductList[index].kiloWeight}Kg",
                        style: NunitoProductTitle(),
                      ),
                      SizedBox(height: 4.0),
                      Text('${favoriteProductList[index].price}원',
                          style: NunitoProductPrice()),
                      SizedBox(height: 4.0),
                      Text(
                          '1kg당 ${favoriteProductList[index].price / favoriteProductList[index].kiloWeight}원',
                          style: NunitoProductSmall()),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
    return cards;
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
                /*
                    Container(
                        padding: const EdgeInsets.only(top: 30.0),
                        width: MediaQuery.of(context).size.width,
                        child: DefaultTabController(length: 2, child: _tabBar)),
                        */
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    padding: const EdgeInsets.all(16.0),

                    childAspectRatio: itemWidth / itemHeight,
                    // TODO: 파이어베이스 연동해서 변수값 가져오기
                    children: _buildGridCards(favoriteProductList.length), //
                  ),
                ),
                /*
                    Expanded(
                      child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: favoriteProductList.length,
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
    );
  }
}

class OrderedCheck extends StatefulWidget {
  @override
  _OrderedCheckState createState() => _OrderedCheckState();
}

class _OrderedCheckState extends State<OrderedCheck> {
  int totalPrice = 0;

  @override
  void initState() {
    setState(() {
      for (int i = 0; i < shoppingProductList.length; i++) {
        totalPrice = totalPrice + shoppingProductList[i].price;
      }
    });
  }

  List<Widget> _buildGridCards(int count) {
    List<Widget> cards = List.generate(
      count,
      (int index) {
        return InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => HomeDetailPage(
                  product: shoppingProductList[index],
                ),
              ),
            );
          },
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
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Icon(
                            Icons.circle,
                            color: Color(0xff9EC151),
                            size: 35,
                          ),
                          Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ],
                      ),
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
                          aspectRatio: 1,
                          child: Image.asset("assets/images/55205930.jpg"),
                        ),
                      ),
                    ),
                    Padding(padding: EdgeInsets.symmetric(horizontal: 10)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "${shoppingProductList[index].title}, ${shoppingProductList[index].kiloWeight}Kg",
                          style: NunitoProductTitle(),
                        ),
                        SizedBox(height: 4.0),
                        Row(
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    //TODO: 수량 -1
                                  });
                                },
                                icon: Icon(Icons.remove)),
                            Text("수량"),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    //TODO: 수량 +1
                                  });
                                },
                                icon: Icon(Icons.add)),
                            Text('${shoppingProductList[index].price}원',
                                style: NunitoProductPrice()),
                          ],
                        ),
                        SizedBox(height: 4.0),
                        Text(
                            '1kg당 ${shoppingProductList[index].price / shoppingProductList[index].kiloWeight}원',
                            style: NunitoProductSmall()),
                      ],
                    ),
                  ],
                ),
                Divider(
                  height: 35,
                  thickness: 2,
                ),
                Center(child: Text("무료배송")),
              ],
            ),
          ),
        );
      },
    );
    return cards;
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
                  child: GridView.count(
                    crossAxisCount: 1,
                    padding: const EdgeInsets.all(16.0),

                    childAspectRatio: itemWidth / itemHeight,
                    // TODO: 파이어베이스 연동해서 변수값 가져오기
                    children: _buildGridCards(shoppingProductList.length), //
                  ),
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
              "총 ${totalPrice}원",
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
