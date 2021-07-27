import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Define the default brightness and colors.
        brightness: Brightness.dark,
        primaryColor: Color(0xFF000000),
        accentColor: Color(0xFF00dea1),
        disabledColor: Color(0xFF87888A),
        backgroundColor: Color(0xFF000000),
        scaffoldBackgroundColor: Color(0xFF000000),

        // Define the default font family.
        fontFamily: 'Open Sans',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: const TextTheme(
          bodyText1: TextStyle(
              fontSize: 11.0,
              fontWeight: FontWeight.normal,
              color: Colors.white54),
          bodyText2: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            color: Color(0xFF00DEA1),
          ),
          subtitle1: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w200,
            color: Color(0xFF87888A),
          ),
          subtitle2: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w200,
            color: Color(0xFF00DEA1),
          ),
          headline1: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          headline2: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w400,
            color: Color(0xFF00DEA1),
          ),
          headline3: TextStyle(
            fontSize: 15.0,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          caption: TextStyle(
            fontSize: 11.0,
            fontWeight: FontWeight.w200,
            color: Colors.white54,
          ),
          button: TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.normal,
            color: Colors.white,
          ),
        ),
      ),
      initialRoute: '/',
    ).modular();
  }
}