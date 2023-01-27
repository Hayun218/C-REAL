import 'package:c_real/consumer.dart';
import 'package:c_real/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'home.dart';
import 'like.dart';

// import 'package:get/get.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({Key? key}) : super(key: key);

  @override
  State<BottomScreen> createState() => BottomScreenState();
}

class BottomScreenState extends State<BottomScreen> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomePage(),
      },
      {

        'page': FavoritePage(),

      },
      {
        'page': OrderedCheck(),
        // 'page': FavoritePage(),

      },
      {
        'page': MyProfile(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              border: Border(
                  top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ))),
          child: BottomNavigationBar(
            onTap: _selectPage,
            selectedItemColor: Color.fromARGB(255, 17, 16, 17),
            selectedFontSize: 0,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'asset/집4x.png',
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset('asset/집회색4x.png',height: 25,width: 25,),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'asset/하트4x.png',
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset('asset/하트회색4x.png',height: 25,width: 25,),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'asset/카트4x.png',
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset('asset/카트회색4x.png',height: 25,width: 25,),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'asset/사람4x.png',
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset('asset/사람회색4x.png',height: 25,width: 25,),
                label: '',
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation:
      //   FloatingActionButtonLocation.miniEndDocked,
    );
  }
}

class BottomScreen1 extends StatefulWidget {
  const BottomScreen1({Key? key}) : super(key: key);

  @override
  State<BottomScreen1> createState() => BottomScreenState1();
}

class BottomScreenState1 extends State<BottomScreen1> {
  late List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void initState() {
    _pages = [
      {
        'page': HomePage(),
      },
      {
        // 'page': const LikePage(),
        'page': LikePage(),

      },
     
      {
        'page': MyProfile(),
      },
    ];
    super.initState();
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: _pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.grey,
              border: Border(
                  top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              ))),
          child: BottomNavigationBar(
            onTap: _selectPage,
            selectedItemColor: Color.fromARGB(255, 17, 16, 17),
            selectedFontSize: 0,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'asset/집4x.png',
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset('asset/집회색4x.png',height: 25,width: 25,),
                label: '',
              ),
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'asset/상점4x.png',
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset('asset/상점회색4x.png',height: 25,width: 25,),
                label: '',
              ),
              
              BottomNavigationBarItem(
                activeIcon: Image.asset(
                  'asset/사람4x.png',
                  height: 25,
                  width: 25,
                ),
                icon: Image.asset('asset/사람회색4x.png',height: 25,width: 25,),
                label: '',
              ),
            ],

          ),
          StadiumBorder(),
        ),

        child: BottomNavigationBar(
          onTap: _selectPage,
          selectedItemColor: Colors.green,
          selectedFontSize: 20,
          currentIndex: _selectedPageIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}

