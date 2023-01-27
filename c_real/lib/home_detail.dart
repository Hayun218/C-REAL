import 'package:flutter/material.dart';
import 'home.dart';
//
class HomeDetailPage extends StatefulWidget {
  const HomeDetailPage({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  _HomeDetailPageState createState() =>
      _HomeDetailPageState(product: this.product);
}
class _HomeDetailPageState extends State<HomeDetailPage> {
  _HomeDetailPageState({
    Key? key,
    required this.product,
  });
  Product product;
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
                tag: product.price,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: (() {}),
                    onDoubleTap: () {
                      setState(() {
                        if (product.isFavorited == false) {
                          product.isFavorited = true;
                          favoriteProductList.add(product);
                        } else {
                          product.isFavorited = false;
                          favoriteProductList.remove(product);
                        }
                      });
                    },
                    child: Image.asset(
                      product.imagePath,
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
                  Icon(
                    product.isFavorited
                        ? Icons.favorite
                        : Icons.favorite_border,
                    size: 40,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
          ]),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
              child: Text(product.title)),
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
                Text("${product.kiloWeight}kg"),
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
                Text("${product.price}원"),
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
              product.price,
              softWrap: true,
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Text("구매"),
      ),
    );
  }
}
