import 'package:age/calculate_Screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Age Calculator',
      debugShowCheckedModeBanner: false,
      home: Calc(),
    );
  }
}
