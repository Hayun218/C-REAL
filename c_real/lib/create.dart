import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';


class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  late bool titleUpload;
  late bool contentUpload;

  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  TextEditingController titleController = TextEditingController();
  TextEditingController storyController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController leftController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController wrapController = TextEditingController();
  TextEditingController fromController = TextEditingController();
  TextEditingController exchangeController = TextEditingController();
  String postTitle = "";
  String story = "";
  String price = "";
  String number = "";
  String weight = "";
  String wraptype = "";
  String from = "";
  String refund = "";



  String _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  final _valueList = ['카테고리', '채소', '과일'];
  var _selectedValue = '카테고리';
  final _valueList0 = ['배송방법', '택배', '직접배송'];
  var _selectedValue0 = '배송방법';
    final _valueList1 = ['배송속성', '일반배송', '오늘출발'];
  var _selectedValue1 = '배송속성';
    final _valueList2 = ['상품별 배송비', '유료', '무료'];
  var _selectedValue2 = '상품별 배송비';
    final _valueList3 = ['결제방식', '착불', '선결제'];
  var _selectedValue3 = '결제방식';
  @override
  void initState() {
    titleUpload = false;
    contentUpload = false;
  }

  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2022), //시작일
      lastDate: DateTime(2024), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      Fluttertoast.showToast(
        msg: dateTime.toString(),
        toastLength: Toast.LENGTH_LONG,
        //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("상품등록"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SingleChildScrollView(
          child: Column(
              children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: _selectedValue,
                    items: _valueList.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedValue = value as String;
                      });
                    },
                  ),
                ),  
                Padding(padding: const EdgeInsets.only(left: 23),
                  child: IconButton(
                  icon: Icon(Icons.date_range),
                  onPressed: () {
                    showDatePickerPop();
                  },
                  
                ),
                )
               
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  labelText: '상품명',
                  // hintText: '제목',
                ),
                onChanged: (value) {
                  setState(() {
                    postTitle = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: priceController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  labelText: '판매가',
                  // hintText: '제목',
                ),
                onChanged: (value) {
                  setState(() {
                    price = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: leftController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  labelText: '재고수량',
                  // hintText: '제목',
                ),
                onChanged: (value) {
                  setState(() {
                    number = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: storyController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.content_paste_go),
                  labelText: '상품상세',
                  // hintText: '내용을 입력하세요',
                ),
                maxLines: 15,
                onChanged: (value) {
                  setState(() {
                    story = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: weightController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  labelText: '중량/용량',
                  // hintText: '제목',
                ),
                onChanged: (value) {
                  setState(() {
                    weight = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: wrapController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  labelText: '포장타입',
                  // hintText: '제목',
                ),
                onChanged: (value) {
                  setState(() {
                    wraptype = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: fromController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  border: OutlineInputBorder(),
                  labelText: '생산지',
                  // hintText: '제목',
                ),
                onChanged: (value) {
                  setState(() {
                    from = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: exchangeController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.content_paste_go),
                  labelText: '교환/반품안내',
                  // hintText: '내용을 입력하세요',
                ),
                maxLines: 10,
                onChanged: (value) {
                  setState(() {
                    refund = value;
                  });
                },
              ),
            ),
            Container(
              width: 400,
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all( 
                  width: 1,
                  color: Color.fromARGB(255, 0, 0, 0), 
                ),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) // POINT
                ),
              ), //  POINT: BoxDecor
              height: 230,
              child: Column(children: [
                Text('배송'),

                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: _selectedValue0,
                    items: _valueList0.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedValue0 = value as String;
                      });
                    },
                  ),
                ),  
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: _selectedValue1,
                    items: _valueList1.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedValue1 = value as String;
                      });
                    },
                  ),
                ),  
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: _selectedValue2,
                    items: _valueList2.map(
                      (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedValue2 = value as String;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 23),
                  child: DropdownButton(
                    value: _selectedValue3,
                    items: _valueList3.map(
                          (value) {
                        return DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      setState(() {
                        if (value != null) _selectedValue3 = value as String;
                      });
                    },
                  ),
                ),
              ]),
            ),
            ElevatedButton(
                onPressed: _selectedValue == '카테고리' ||
                    _selectedValue0 == '배송방법' ||
                    _selectedValue1 == '배송속성' ||
                    _selectedValue2 == '상품별 배송비' ||
                    _selectedValue3 == '결제방식' ||
                        story == "" ||
                        postTitle == ""||
                        price == ""||
                        number == ""||
                        weight== ""||
                        wraptype== ""||
                        from== ""||
                        refund== ""
                    ? null
                    : () {
                        String postKey = getRandomString(16);
                        fireStore
                            .collection(_selectedValue)
                            .doc('Posts')
                            .collection('Posts')
                            .doc(postKey)
                            .set({
                          "key": postKey,
                          "title": postTitle,
                          "price": price,
                          "left" : number,
                          "weight":weight,
                          "wraptype":wraptype,
                          "wherefrom":from,
                          "exchange" :refund,
                          "explain": story,
                          "firstPicUrl": "",
                          "firstPicWidth": 0,
                          "firstPicHeight": 0,
                          "authorName":
                              FirebaseAuth.instance.currentUser!.displayName,
                          "like": 0,
                          'timeStamp': DateTime.now(),
                        });
                        Get.back();
                        // FirebaseFirestore
                        // fireStore = FirebaseFirestore.instance;
                      },
                style: ElevatedButton.styleFrom(
                    onSurface: Color.fromARGB(255, 63, 141, 180)),
                child: Text("upload")),
          ]),
        ),
      ),
    );
  }
}