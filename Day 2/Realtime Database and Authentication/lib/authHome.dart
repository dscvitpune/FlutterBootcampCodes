import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

import 'getDataInList.dart';

class AuthHome extends StatefulWidget {
  AuthHome(this.user);
  String name = "";
  String grn = "";
  final String user;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  _AuthHomeState createState() => _AuthHomeState();
}

class _AuthHomeState extends State<AuthHome> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController controllerKey, controllerName, controllerGRN;
  @override
  void initState() {
    super.initState();
    controllerKey = TextEditingController();
    controllerName = TextEditingController();
    controllerGRN = TextEditingController();
    controllerKey.text = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    final userKeyField = TextField(
      style: style,
      controller: controllerKey,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "user key",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final nameField = TextField(
      style: style,
      controller: controllerName,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Name",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final grnField = TextField(
      style: style,
      controller: controllerGRN,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "GRN",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final logoutButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () async {
          await auth.signOut();
          Navigator.pop(context);
        },
        child: Text("Logout",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final setButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: setDataFunc,
        child: Text("Set Data",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final fetchButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: getDataFunc,
        child: Text("Fetch data",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    final listButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ListDataPage()));
        },
        child: Text("Show List",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[
            userKeyField,
            Padding(padding: EdgeInsets.all(5)),
            logoutButon,
            Padding(padding: EdgeInsets.all(5)),
            nameField,
            Padding(padding: EdgeInsets.all(5)),
            grnField,
            Padding(padding: EdgeInsets.all(5)),
            setButon,
            Padding(padding: EdgeInsets.all(5)),
            fetchButon,
            Padding(padding: EdgeInsets.all(5)),
            listButon
          ],
        ),
      ),
    );
  }

  void getDataFunc() {
    FirebaseDatabase.instance
        .reference()
        .child("Users")
        .child(widget.user)
        .once()
        .then((DataSnapshot dataSnapshot) async {
      Map<String, String> map = Map.from(dataSnapshot.value);
      if (dataSnapshot.value != null) {
        controllerName.text = map["name"];
        controllerGRN.text = map["grn"];
      }
    });
  }

  void setDataFunc() {
    FirebaseDatabase.instance
        .reference()
        .child("Users")
        .child(widget.user)
        .set({'name': controllerName.text, 'grn': controllerGRN.text});
  }
}
