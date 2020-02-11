import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';

void main() => runApp(SensorApp());

class SensorApp extends StatefulWidget {
  @override
  _SensorAppState createState() => _SensorAppState();
}

class _SensorAppState extends State<SensorApp> {
  List<double> _accelerometerValues;
  List<double> _userAccelerometerValues;
  List<double> _gyroscopeValues;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    accelerometerEvents.listen((AccelerometerEvent event) {
      setState(() {
        _accelerometerValues = <double>[event.x, event.y, event.z];
      });
    });
    // [AccelerometerEvent (x: 0.0, y: 9.8, z: 0.0)]

    userAccelerometerEvents.listen((UserAccelerometerEvent event) {
      setState(() {
        _userAccelerometerValues = <double>[event.x, event.y, event.z];
      });
    });
    // [UserAccelerometerEvent (x: 0.0, y: 0.0, z: 0.0)]

    gyroscopeEvents.listen((GyroscopeEvent event) {
      setState(() {
        _gyroscopeValues = <double>[event.x, event.y, event.z];
      });
    });
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(centerTitle: true,title: Text("Fun With Sensors"),),
          body: Center(
            child: Column(
              children: <Widget>[
                Text("Accelerometer: \n$_accelerometerValues",style: TextStyle(height: 2, fontSize: 20)),
                Text("Gyroscope: \n$_gyroscopeValues",style: TextStyle(height: 2, fontSize: 20)),
                Text("User:\n$_userAccelerometerValues",style: TextStyle(height: 2, fontSize: 20))
              ],
            ),
          )),
    );
  }
}
