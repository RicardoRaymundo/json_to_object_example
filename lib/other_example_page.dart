import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_to_object_example/course.dart';

Future<Course> loadData() async {
  String dataRaw = await rootBundle.loadString('assets/data_literature.json');
  final Map<String, dynamic> data = json.decode(dataRaw);
  return Course.data(data);
}

class OtherExamplePage extends StatefulWidget {
  @override
  OtherExamplePageState createState() => OtherExamplePageState();
}

class OtherExamplePageState extends State<OtherExamplePage> {
  Widget futureWidget() {
    return new FutureBuilder<Course>(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return new Container(
              padding: new EdgeInsets.all(20.0),
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: Text('Curso: ${snapshot.data.title}\n '
                        'Descrição: ${snapshot.data.description}\n '
                        'Autor: ${snapshot.data.author}\n '
                        'Sobre o autor: ${snapshot.data.authorInfo}\n '
                        'Ano: ${snapshot.data.year}\n '
                        'Lições: ${snapshot.data.lessons}'
                    ),
                  )
                ],
              ));
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return new Text("${snapshot.error}");
        }
        return new CircularProgressIndicator();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Scaffold(body: futureWidget()));
  }
}
