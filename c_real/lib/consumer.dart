import 'dart:js_util';

import 'package:flutter/material.dart';

import 'home.dart';
import 'home_detail.dart';
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
                        Text('${shoppingProductList[index].price}원',
                            style: NunitoProductPrice()),
                        SizedBox(height: 4.0),
                        Text(
                            '1kg당 ${shoppingProductList[index].price / shoppingProductList[index].kiloWeight}원',
                            style: NunitoProductSmall()),
                        Text(
                            '1kg당 ${shoppingProductList[index].price / shoppingProductList[index].kiloWeight}원',
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
    );
  }
}
