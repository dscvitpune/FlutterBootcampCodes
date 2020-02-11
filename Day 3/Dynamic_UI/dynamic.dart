import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() => runApp(MyScreen());

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  var screen_no = 0;
  DateTime last_time = DateTime.now();
  DateTime curr;
  double last_x = 0, last_y = 0, last_z = 0;
  List<Color> screen_color = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.black,
    Colors.yellow,
    Colors.white
  ];

  @override
  Widget build(BuildContext context) {
    accelerometerEvents.listen((AccelerometerEvent event) {
      var speed =
          sqrt(pow(event.x - last_x, 2) + pow(event.y - last_y, 2)).abs();
      curr = DateTime.now();
      int tmp = curr.difference(last_time).inSeconds;
      if (speed > 15 && tmp > 2) {
        setState(() {
          last_x = event.x;
          last_y = event.y;
          last_z = event.z;
          last_time = curr;
          if (screen_no == screen_color.length - 1) {
            screen_no = 0;
          } else {
            screen_no += 1;
          }
        });
      }
    });
    return MaterialApp(
      title: "Tap or Shake",
      home: Container(
        child: GestureDetector(
          onTap: () {
            setState(() {
              if (screen_no == screen_color.length - 1) {
                screen_no = 0;
              } else {
                screen_no += 1;
              }
            });
          },
          child: AnimatedContainer(
            height: double.infinity,
            width: double.infinity,
            color: findColor(),
            duration: Duration(seconds: 1),
            curve: Curves.easeInOutExpo,
            child: Container(
              child: Center(
                child: Text(
                  screen_no.toString(),
                  style: TextStyle(
                    fontSize: 40,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 6
                      ..color =
                          screen_color[(screen_no + 1) % screen_color.length],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Color findColor() {
    return screen_color[screen_no];
  }
}
