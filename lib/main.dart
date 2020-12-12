import 'package:flutter/material.dart';
import 'package:horoscope_app/screens/Detail.dart';
import 'package:horoscope_app/screens/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Burç Özellikleri",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
