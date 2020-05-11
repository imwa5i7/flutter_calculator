import 'package:flutter/material.dart';
import 'package:flutter_calculator/screen.dart';

void main() => runApp(MyApp());
String expression;
double result;


class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Screen(),
            ),
          ),
        ),
      ),
    );
  }
}
