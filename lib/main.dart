import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(debugShowCheckedModeBanner: false, title: "UI challenege 2", home: MyHomePage());
    throw UnimplementedError();
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyHomePageState();
    throw UnimplementedError();
  }
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    List<String> values = [
      'assets/ne.jpg',
      'assets/ne.jpg',
      'assets/ne.jpg',
      'assets/ne.jpg',
      'assets/ne.jpg',
      'assets/ne.jpg',
      'assets/ne.jpg',
      'assets/ne.jpg'
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text('UI challenege2'),
          backgroundColor: Colors.green,
        ),
        body: Container(
            child: GridView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Card(
                child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Image.asset(values[index]),
              ),
            ));
          },
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        )));
    throw UnimplementedError();
  }
}
