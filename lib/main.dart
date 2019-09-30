import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_to_object_example/page_splashscreen.dart';
import 'package:json_to_object_example/theme/theme_config.dart';
import 'package:json_to_object_example/theme/theme_select.dart';

void main() {
  //Configura a orientação inical da aplicação
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(

    /// Configura o tema inical da aplicação
    ThemeConfig(
      initialTheme: ThemeAspect.DARK,
      child: Main(),
    ),
  );
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'json loader',
      theme: ThemeConfig.of(context),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: PageSplashScreen(),
      ),
    );
  }
}


/// matrix_example
/// course_load_json_example
/// course_load_json_section_example

// https://medium.com/@muddassirm/load-json-data-in-flutter-in-different-ways-e3312e6a317a