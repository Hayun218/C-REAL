import 'package:flutter/material.dart';

import 'theme.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<Card> _buildGridCards(int count) {
    List<Card> cards = List.generate(
      count,
      (int index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                  aspectRatio: 18.0 / 11.0,
                  child: Image.asset('assets/images/55205930.jpg')),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Title',
                      style: NonCustomFont(),
                    ),
                    SizedBox(height: 8.0),
                    Text('Secondary Text', style: NonCustomFont()),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
    return cards;
  }

  Widget _ListViewCard(BuildContext context, int index) {
    return Card(
      child: ListTile(
        leading: Hero(
          tag: productList[index].imagePath,
          child: Material(
            color: Colors.transparent,
            child: AspectRatio(
              aspectRatio: 1,
              child: Text(productList[index].imagePath),
            ),
          ),
        ),
        title: Column(
          children: [
            // StarCount(starNum: product.starCount, size: 10),
            Text(
              productList[index].title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        subtitle: Text(productList[index].price),
        trailing: SizedBox(
          height: 20,
          width: 40,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0.0),
              textStyle: const TextStyle(fontSize: 12),
            ),
            child: const Text('more'),
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => HomeDetailPage(
              //               product: product,
              //             )));
            },
          ),
        ),
        isThreeLine: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar:
      // AppBar(
      //   actions: [
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.search),
      //     ),
      //     IconButton(
      //       onPressed: () {},
      //       icon: Icon(Icons.menu),
      //     )
      //   ],
      // ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: productList.length,
            itemBuilder: (context, index) {
              return _ListViewCard(context, index);
            },
          ),
        ),
      ),
      // Expanded(
      //   child: GridView.count(
      //     crossAxisCount: 2,
      //     padding: const EdgeInsets.all(16.0),
      //     childAspectRatio: 8.0 / 9.0,
      //     // TODO: 파이어베이스 연동해서 변수값 가져오기
      //     children: _buildGridCards(10), //
      //   ),
      // ),
    );
  }
}

class Product {
  const Product(this.imagePath, this.price, this.title);
  final String imagePath;
  final String price;
  final String title;
}

List<Product> productList = [
  Product('imagePath1', '10', 'title1'),
  Product('imagePath2', '11', 'title2'),
  Product('imagePath3', '12', 'title3'),
  Product('imagePath4', '13', 'title4'),
];
