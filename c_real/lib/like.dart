import 'package:flutter/material.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
}