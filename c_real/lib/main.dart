import 'package:flutter/material.dart';

void main() {
  runApp(const CReal());
}

class CReal extends StatelessWidget {
  const CReal({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'C:REAL',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CRealPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class CRealPage extends StatefulWidget {
  const CRealPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CRealPage> createState() => _CRealPageState();
}

class _CRealPageState extends State<CRealPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
