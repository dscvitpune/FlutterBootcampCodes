import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flare_flutter/flare.dart';

void main() => runApp(Flare());

class Flare extends StatefulWidget {
  @override
  _FlareState createState() => _FlareState();
}

class _FlareState extends State<Flare> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        child: FlareActor(
          "assets/Atom.flr",
          animation: "Start",
        ),
      ),
    );
  }
}