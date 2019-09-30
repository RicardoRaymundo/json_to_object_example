import 'package:flutter/material.dart';
import 'package:json_to_object_example/other_example_page.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _MainPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class _MainPage extends StatefulWidget {
  _MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<_MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: OtherExamplePage(),
    );
  }
}

// https://medium.com/@muddassirm/load-json-data-in-flutter-in-different-ways-e3312e6a317a