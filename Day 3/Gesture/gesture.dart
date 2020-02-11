import 'package:flutter/material.dart';

void main() => runApp(Gesture());

class Gesture extends StatefulWidget {
  @override
  _GestureState createState() => _GestureState();
}

class _GestureState extends State<Gesture> {
  String title = "Gestures everywhere..!";
  Color color = Colors.black;
  List<double> el = <double>[0, 0, 0, 0];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
          centerTitle: true,
          backgroundColor: color,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: GridView.count(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: el[0],
                  color: Colors.orange,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onDoubleTap: () {
                        setState(() {
                          color = el[0] == 0 ? Colors.orange : Colors.black;
                          el[0] = el[0] == 20 ? 0 : 20;
                        });
                      },
                      child: Container(
                        color: Colors.orange,
                        child: Center(
                            child: Text(
                          "Double Tap",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.red[400],
                  elevation: el[1],
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          color = el[1] == 0 ? Colors.red[400] : Colors.black;
                          el[1] = el[1] == 20 ? 0 : 20;
                        });
                      },
                      child: Container(
                        color: Colors.red[400],
                        child: Center(
                            child: Text(
                          "Tap",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: el[2],
                  color: Colors.lightGreen,
                  child: GestureDetector(
                    onLongPress: () {
                      setState(() {
                        color = el[2] == 0 ? Colors.lightGreen : Colors.black;
                        el[2] = el[2] == 20 ? 0 : 20;
                      });
                    },
                    child: Container(
                      color: Colors.lightGreen,
                      child: Center(
                          child: Text(
                        "Long Press",
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: el[3],
                  color: Colors.pink,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: GestureDetector(
                      onScaleEnd: (ScaleEndDetails s) {
                        setState(() {
                          color = el[3] == 0 ? Colors.pink : Colors.black;
                          el[3] = el[3] == 20 ? 0 : 20;
                        });
                      },
                      child: Container(
                        color: Colors.pink,
                        child: Center(
                            child: Text(
                          "Scale In",
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
            ],
            crossAxisCount: 1,
            scrollDirection: Axis.vertical,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            padding: EdgeInsets.fromLTRB(100,10,100,10),
          ),
        ),
      ),
    );
  }
}
