import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import 'home.dart';
import 'home_detail.dart';
import 'theme.dart';

class OrderListPage extends StatefulWidget {
  @override
  _OrderListPageState createState() => _OrderListPageState();
}

class _OrderListPageState extends State<OrderListPage> {
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
            // Navigator.of(context).push(
            //   MaterialPageRoute(
            //     builder: (context) => HomeDetailPage(
            //       product: shoppingProductList[index],
            //     ),
            //   ),
            // );
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("배송중"),
                      Text("   "),
                      Text("00-00 도착"),
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
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${shoppingProductList[index].price}원',
                              style: GoogleFonts.nunito(
                                  color: Color(0xff9EC151),
                                  fontSize: 20,
                                  height: 27 / 20,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text('   ', style: NunitoProductPrice()),
                            Text(
                              '${shoppingProductList[index].price}개',
                              style: GoogleFonts.nunito(
                                  color: Colors.black,
                                  fontSize: 16,
                                  height: 22 / 16,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      minWidth: 150,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {},
                      color: Color(0xffE7E7E7),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "리뷰 작성하기",
                          style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 14,
                              height: 19 / 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    MaterialButton(
                      minWidth: 150,
                      height: 40,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                      onPressed: () {},
                      color: Color(0xff9EC151),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "배송조회",
                          style: GoogleFonts.nunito(
                              color: Colors.black,
                              fontSize: 14,
                              height: 19 / 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
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
    final double itemHeight = size.height / 6;
    final double itemWidth = size.width / 2;

    return Scaffold(
      backgroundColor: Color(0xffF5F6F8),
      appBar: AppBar(
        title: Text(
          "주문목록",
          style: GoogleFonts.nunito(
              color: Color(0xff9EC151),
              fontSize: 20,
              height: 27 / 20,
              letterSpacing: 0,
              fontWeight: FontWeight.w700),
        ),
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
