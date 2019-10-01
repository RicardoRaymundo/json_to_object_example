import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_to_object_example/course/course.dart';
import 'package:json_to_object_example/section_page.dart';
import 'package:json_to_object_example/photo_from_json_page.dart';

/// A classe PageSplashScreen é responsavel pela apresentação inicial da logo da aplicação
class PageSplashScreen extends StatefulWidget {
  @override
  _PageSplashScreenState createState() => _PageSplashScreenState();
}

class _PageSplashScreenState extends State<PageSplashScreen> {
  final bool isLogged = false;

  @override
  void initState() {
    super.initState();

    /// Método de delay e navegação criado fora do initState
    this.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            child: Image.asset('assets/images/miranha.png'),
          ),
        ));
  }

  /// Método que fará um delay, posteriormente chamando outro método
  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 5), this.onDoneLoading);
  }

  /// Método que será chamado após o delay
  /// Verifica o status de login e decide para qual página irá navegar
  void onDoneLoading() async {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => isLogged ? PhotoFromJsonPage() : SectionPage()));
  }

  /// Carregando os dados do curso
  Future<Map<String, Object>> loadDataSeries(String course, int index, int len) async {
    course = 'assets/data/${course}.json';
    String dataRaw = await rootBundle.loadString(course);
    final Map<String, dynamic> data = json.decode(dataRaw);
    return {'course': Course.generate(data), 'index': index, 'len': len};
  }

  /// Carregando os dados do curso
  Future<Course> loadDatax() async {
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
}
