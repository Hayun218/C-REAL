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

  void initState(){
    _pages=[
      {
        'page':HomePage(),
      },
      {
        'page': const LikePage(),
      },
      {
        'page':MyProfile(),
      },
      
    ];
    super.initState();
  }

  void _selectPage(int index){
    setState(() {
      _selectedPageIndex = index;
    });
  }
  
  
  
  // int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // final List<Widget> _widgetOptions = <Widget>[
  //   HomeScreen(),
  //   const CategoryScreen(),
  //   LikePage(),
  //   CreatePostPage(),
    
  //   // const NotificationPage(),
    
  // ];

// void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }



  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: logo(),
        // backgroundColor: Colors.red,
      ),
      backgroundColor: Color.fromARGB(255, 252, 251, 251),
      body:_pages[_selectedPageIndex]['page'] as Widget,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 0.01,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border(
              top: BorderSide(
                color: Colors.grey,
                width: 0.5,
              )
            )
          ),
          child: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.purple,
            selectedItemColor: Color.fromARGB(255, 17, 16, 17),
            selectedFontSize: 20,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                icon: Text('Home'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Text('Category'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Text('Like'),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Text(''),
                label: '',
              ),

            ],
          ),
        ),
      ),
      floatingActionButtonLocation: 
        FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(4.0),
        child: FloatingActionButton(
          hoverElevation: 10,
          splashColor: Color.fromARGB(255, 174, 26, 26),
          tooltip:'plus',
          elevation: 4,
          child: Icon(Icons.add),
          foregroundColor: Color.fromARGB(255, 34, 34, 32),

          backgroundColor: Color.fromARGB(255, 253, 254, 254),
          onPressed: () {
            // setState(() {
            // _selectedPageIndex = 3;
            // });

            // Get.to(() => CreatePostPage());
          }
          
        ),
      ),
    );
  }
  Widget logo(){
    return Image.asset('asset/images/logo.png',height: 110,width: 110,);
  }
}