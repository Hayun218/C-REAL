import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'app.dart';

class Select extends StatefulWidget {
  const Select({Key? key}) : super(key: key);

  @override
  State<Select> createState() => _SelectState();
}

class _SelectState extends State<Select> {
  bool _isClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 75,
          ),
          Text(
            '단계 1/2',
            style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 158, 193, 81),
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            '직종이 무엇인가요?',
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _isClicked == true
                    ? Column(
                        children: [
                          Text(
                            '농부',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '농산물을 팔아요',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(160, 0, 0, 0)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              border: Border.all(
                                color: Color.fromARGB(255, 158, 193, 81),
                                width: 4,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: Offset(
                                      2, 0), // changes position of shadow
                                ),
                              ],
                              image: DecorationImage(
                                image: ExactAssetImage('asset/농부.png'),
                                // fit: BoxFit.fitHeight,
                              ),
                            ),
                            height: 245,
                            width: 175,
                          ),
                          SizedBox(height: 30),
                          Image.asset('asset/클릭된거.png')
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            '농부',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(80, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '농산물을 팔아요',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(40, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _isClicked = true;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: Offset(
                                        2, 0), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                  image: ExactAssetImage('asset/농부.png'),
                                  // fit: BoxFit.fitHeight,
                                ),
                              ),
                              height: 249,
                              width: 179,
                            ),
                          ),
                          SizedBox(height: 30),
                          Image.asset('asset/클릭안된거.png')
                        ],
                      ),
                _isClicked == true
                    ? Column(
                        children: [
                          Text(
                            '자영업자',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(80, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '농산물을 사요',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(40, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                border: Border.all(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0,
                                    blurRadius: 10,
                                    offset: Offset(
                                        2, 0), // changes position of shadow
                                  ),
                                ],
                                image: DecorationImage(
                                  image: ExactAssetImage('asset/자영업ㅈ.png'),
                                  // fit: BoxFit.fitHeight,
                                ),
                              ),
                              height: 245,
                              width: 175,
                            ),
                            onTap: () {
                              setState(() {
                                _isClicked = false;
                              });
                            },
                          ),
                          SizedBox(height: 30),
                          Image.asset('asset/클릭안된거.png')
                        ],
                      )
                    : Column(
                        children: [
                          Text(
                            '자영업자',
                            style: TextStyle(
                                fontSize: 20,
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '농산물을 사요',
                            style: TextStyle(
                                fontSize: 16,
                                color: Color.fromARGB(160, 0, 0, 0)),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              border: Border.all(
                                color: Color.fromARGB(255, 158, 193, 81),
                                width: 4,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 0,
                                  blurRadius: 8,
                                  offset: Offset(
                                      2, 0), // changes position of shadow
                                ),
                              ],
                              image: DecorationImage(
                                image: ExactAssetImage('asset/자영업ㅈ.png'),
                                // fit: BoxFit.fitHeight,
                              ),
                            ),
                            height: 249,
                            width: 179,
                          ),
                          SizedBox(height: 30),
                          Image.asset('asset/클릭된거.png')
                        ],
                      )
              ],
            ),
          ),
          SizedBox(
            height: 85,
          ),
          GestureDetector(
            child: Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 158, 193, 81),
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 0,
                      blurRadius: 8,
                      offset: Offset(2, 0), // changes position of shadow
                    ),
                  ],
                ),
                width: 357,
                height: 60,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 14,
                    ),
                    Text('다음 단계로 넘어가요',
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.bold)),
                  ],
                )),
            onTap: () {
              _isClicked == true
                  ? (Get.offAll(() => App1()))
                  : (Get.offAll(() => App()));
            },
          ),
        ],
      ),
    );
  }
}
