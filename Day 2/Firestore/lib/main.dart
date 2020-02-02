import 'package:dsc_fb/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Blog App",
      theme: new ThemeData(primarySwatch: Colors.pink),
      home: HomePage(),
    );
  }
}
