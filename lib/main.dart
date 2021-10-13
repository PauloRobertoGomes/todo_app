import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:todo_app/app/home_page.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
        brightness: Brightness.dark,
        buttonColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.black),
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark,
          centerTitle: true,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.black),
          ),
        ),
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
