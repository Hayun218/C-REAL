import 'package:c_real/home_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consumer.dart';
import 'theme.dart';

int pageChanged = 0;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  bool _isSearchActivated = false;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
                  product: fruitProductList[index],
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
                Hero(
                  tag: fruitProductList[index].price,
                  child: Material(
                    color: Colors.transparent,
                    child: AspectRatio(
                      aspectRatio: 18.0 / 11.0,
                      child: Image.asset("assets/images/55205930.jpg"),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${fruitProductList[index].title}, ${fruitProductList[index].kiloWeight}Kg",
                        style: NunitoProductTitle(),
                      ),
                      SizedBox(height: 4.0),
                      Text('${fruitProductList[index].price}원',
                          style: NunitoProductPrice()),
                      SizedBox(height: 4.0),
                      Text(
                          '1kg당 ${fruitProductList[index].price / fruitProductList[index].kiloWeight}원',
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

  Widget _ListViewCard(BuildContext context, int index) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => HomeDetailPage(
                product: fruitProductList[index],
              ),
            ),
          );
        },
        child: ListTile(
          leading: Hero(
            tag: fruitProductList[index].price,
            child: Material(
              color: Colors.transparent,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset("assets/images/55205930.jpg"),
              ),
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
          backgroundColor: Color(0xff9EC151),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  _isSearchActivated = !_isSearchActivated;
                });
              },
              icon: Icon(Icons.search),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.logout_rounded)),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FavoritePage(),
                  ),
                );
              },
              icon: Icon(Icons.star),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => OrderedCheck(),
                  ),
                );
              },
              icon: Icon(Icons.shopping_bag),
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: const <Widget>[
              Tab(
                child: Text("과일"),
              ),
              Tab(
                child: Text("야채"),
              ),
            ],
          ),
        ),
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
                      child: GridView.count(
                        crossAxisCount: 2,
                        padding: const EdgeInsets.all(16.0),

                        childAspectRatio: itemWidth / itemHeight,
                        // TODO: 파이어베이스 연동해서 변수값 가져오기
                        children: _buildGridCards(fruitProductList.length), //
                      ),
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
                      child: ListView.builder(
                        padding: EdgeInsets.all(8),
                        itemCount: fruitProductList.length,
                        itemBuilder: (context, index) {
                          return _ListViewCard(context, index);
                        },
                      ),
                    ),
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
