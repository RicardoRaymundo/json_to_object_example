import 'dart:async' show Future;
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:json_to_object_example/course/course.dart';

class SectionPage extends StatefulWidget {
  @override
  SectionPageState createState() => SectionPageState();
}

class SectionPageState extends State<SectionPage> {
  @override
  void initState() {
    super.initState();

    /// Método de delay e navegação criado fora do initState
    this.loadData();
  }

  /// Carregando os dados do curso
  Future<Map<String, Object>> loadDataSeries(String course, int index, int len) async {
    course = 'assets/data/${course}.json';
    String dataRaw = await rootBundle.loadString(course);
    final Map<String, dynamic> data = json.decode(dataRaw);
    return {'course': Course.generate(data), 'index': index, 'len': len};
  }

  /// Carregando os dados do curso
  Future<Course> loadData() async {
    List<String> listCourses = [
      'data_literature',
      'data_literature',
      'data_literature'
    ];

    List<Course> listCoursesObject = [];

    callback(Map<String, Object> value) {
      listCoursesObject.add(value['course']);
      print('then');
      print(value['index']);
      if (value['index'] == (value['len'] as int) - 1) {
        print('terminouBBBB');
        print(listCoursesObject);
      }
    }
    int len = listCourses.length;

    for (int i = 0; i < len; i++) {
      Future<Map<String, Object>> course = loadDataSeries(listCourses[i], i, len);
      course.then(callback);
    }
  }

  Widget futureWidget() {
    return Container(
      child: Text('AAAAAAAAAAAAA'),
    );
    /*
    return new FutureBuilder<Course>(
      future: loadData(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: ListView(
                children: <Widget>[
                  new Container(
                    padding: new EdgeInsets.all(20.0),
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          child: Text('Curso: ${snapshot.data.title}\n '
                              'Descrição: ${snapshot.data.description}\n '
                              'Autor: ${snapshot.data.author}\n '
                              'Sobre o autor: ${snapshot.data.authorInfo}\n '
                              'Ano: ${snapshot.data.year}\n '
                              'Lições: ${snapshot.data.lessons[0].placementTest[0].alternatives[0].title}'
                          ),
                        )
                      ],
                    ),
                  ),
                  SectionMoviesPopular(title: 'Populares'),
                  //SectionMoviesContinueWatching(title: 'Continue Assistindo',),
                  //SectionMovieBanner(title: 'Disponível agora',),
                  //SectionMoviesOriginals(title: 'ORIGINAIS NEW SCHOOL',),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          print(snapshot.error);
          return new Text("${snapshot.error}");
        }
        return new CircularProgressIndicator();
      },
    );
     */
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(home: new Scaffold(body: futureWidget()));
  }
}
