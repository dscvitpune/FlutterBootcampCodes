import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddPage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _AddPage();
  }
}

class _AddPage extends State<AddPage> {
  String sname = "";
  String sid = "";
  String sage = "";
  String scontact = "";
  String ssubject = "";

  final nameController = new TextEditingController();
  final idController = new TextEditingController();

  final ageController = new TextEditingController();
  final contactController = new TextEditingController();

  final subjectController = new TextEditingController();

  void addStudent(
      String sname, String sid, String sage, String scontact, String ssubject) {
    Firestore.instance.collection('Student').add({
      "name": sname,
      "id": sid,
      "age": sage,
      "contact": scontact,
      "subject": ssubject
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.pink,
        title: Text("Add New Student Information"),
      ),
      body: new ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: nameController,
              onChanged: (String str) {
                sname = str.toString();
              },
              decoration: InputDecoration(
                  hintText: 'Student Name', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: idController,
              onChanged: (String str) {
                sid = str.toString();
              },
              decoration: InputDecoration(
                  hintText: 'Student Id', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: ageController,
              onChanged: (String str) {
                sage = str.toString();
              },
              decoration: InputDecoration(
                  hintText: 'Student age', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: contactController,
              onChanged: (String str) {
                scontact = str.toString();
              },
              decoration: InputDecoration(
                  hintText: 'Student Contact', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: subjectController,
              onChanged: (String str) {
                ssubject = str.toString();
              },
              decoration: InputDecoration(
                  hintText: 'Subject', border: OutlineInputBorder()),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(60.0),
            child: new FlatButton(
              child: Text(
                "Add to List",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.pink,
              onPressed: () {
                setState(() {});

                addStudent(sname, sid, sage, scontact, ssubject);
              },
            ),
          )
        ],
      ),
    );
  }
}
