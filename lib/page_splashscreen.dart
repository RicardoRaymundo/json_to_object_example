import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:json_to_object_example/other_example_page.dart';
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
        .pushReplacement(MaterialPageRoute(builder: (context) => isLogged ? PhotoFromJsonPage() : OtherExamplePage()));
  }
}
