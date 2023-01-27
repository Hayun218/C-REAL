import 'package:flutter/material.dart';

import 'consumer.dart';

// 자영업자

int pageChanged = 2;

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  // BottomAppBar appBottom(BuildContext context) {
  //   return BottomAppBar(
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         IconButton(
  //           onPressed: () => Navigator.pushNamed(context, '/home'),
  //           icon: Icon(pageChanged == 0 ? Icons.home : Icons.home_outlined),
  //         ),
  //         IconButton(
  //           onPressed: () => Navigator.pushNamed(context, '/community'),
  //           icon: Icon(pageChanged == 1
  //               ? Icons.fact_check
  //               : Icons.fact_check_outlined),
  //         ),
  //         IconButton(
  //             onPressed: () => Navigator.pushNamed(context, '/profile'),
  //             icon: Icon(pageChanged == 2
  //                 ? Icons.account_circle
  //                 : Icons.account_circle_outlined)),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          margin: const EdgeInsets.fromLTRB(50, 20, 50, 30),
          child: Column(
            children: [
              const SizedBox(height: 60),
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/dog-puppy-on-garden-royalty-free-image-1586966191.jpg?crop=0.752xw:1.00xh;0.175xw,0&resize=1200:*',
                  ), // Text(key['title']),
                ),
              ),
              const SizedBox(height: 30),
              Text("name"),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () =>
                    null, //Navigator.pushNamed(context, '/order_c'),
                child: Text("내 정보 관리"),
              ),
              const Divider(
                height: 25,
                thickness: 1,
                color: Colors.grey,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextButton(
                    onPressed: () {
                    //   Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => OrderedCheck()),
                    // );
                    } ,
                    child: Text("주문내역"),
                  ),
                  TextButton(
                    onPressed: () =>
                        null, //Navigator.pushNamed(context, '/ask_c'),
                    child: Text("1:1 문의내역"),
                  ),
                  TextButton(
                    onPressed: () =>
                        null, //Navigator.pushNamed(context, '/deliver_c'),
                    child: Text("주문배송조회"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoritePage()),
                    ),
                    child: Text("즐겨찾기 관리"),
                  ),
                ],
              ),
            ],
          ),
        ),
        // bottomNavigationBar: appBottom(context)
        );
  }
}
