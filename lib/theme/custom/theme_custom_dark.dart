import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemeCustomDark {
  static final ThemeData data = ThemeData(
    // Define as cores e brilho default do app.
    primaryColor: Colors.grey,
    accentColor: Colors.cyan[600],
    backgroundColor: Colors.red,
    brightness: Brightness.dark,
    // Define a font family default.
    fontFamily: 'Montserrat',

    colorScheme: ColorScheme(
      primary: Colors.purple,
      primaryVariant: Color(0xff3700b3),
      secondary: Color(0xff03dac6),
      secondaryVariant: Color(0xff018786),
      surface: Colors.amber,
      background: Colors.green,
      error: Color(0xffb00020),
      onPrimary: Colors.yellowAccent,
      onSecondary: Colors.black,
      onSurface: Colors.orange[900],
      onBackground: Colors.lime,
      onError: Colors.redAccent,
      brightness: Brightness.dark,
    ),

    cardColor: Colors.purple,
    buttonTheme: ButtonThemeData(
      buttonColor: Color(0xffb2228c),
    ),
    // Define o TextTheme default. Use isso para especificar o estilo de texto
    // default para headlines, titles, corpos de texto, etc.
    textTheme: TextTheme(
      headline: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      title: TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic, color: Colors.red),
      body1: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      button: TextStyle(color: Colors.grey),
    ),
  );
}
