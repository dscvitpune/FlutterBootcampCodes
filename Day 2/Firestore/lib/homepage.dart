import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dsc_fb/addPage.dart';
import 'package:dsc_fb/blogPage.dart';
import 'package:dsc_fb/updatePage.dart';
//import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  void delete(String d) async {
    Firestore.instance
        .collection('Student')
        .document(d)
        .delete()
        .catchError((onError) {
      print(onError);
    });
    //Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: new AppBar(
          title: Text("Students"),
          backgroundColor: Colors.pink,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return new AddPage();
                }));
              },
            ),
          ],
        ),
        drawer: new Drawer(),
        body: Center(
          child: Container(
              padding: const EdgeInsets.all(10.0),
              child: StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('Student').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return new Text('Error: ${snapshot.error}');
                  }

                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      return new ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new Card(
                            elevation: 30,
                            margin: EdgeInsets.all(15),
                            child: new Container(
                              padding: new EdgeInsets.all(14),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  new Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        children: <Widget>[
                                          new Text(
                                            document['name'],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                        ],
                                      ),
                                      new Icon(
                                        Icons.favorite,
                                        color: Colors.red,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      new Text("Subject :"),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      new Text(document['subject'].toString()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      new Text("Contact :"),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      new Text(document['contact'].toString()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      new Text("Id :"),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      new Text(document['id'].toString()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  Row(
                                    children: <Widget>[
                                      new Text("Age :"),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      new Text(document['age'].toString()),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 18,
                                  ),
                                  RaisedButton(
                                    child: Text("Update"),
                                    elevation: 47,
                                    color: Colors.green,
                                    onPressed: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        String s_name;
                                        String s_id;
                                        String s_age;
                                        String s_contact;
                                        String s_subject;
                                        s_name = document['name'].toString();
                                        s_id = document['id'].toString();
                                        s_age = document['age'].toString();
                                        s_contact =
                                            document['contact'].toString();
                                        s_subject =
                                            document['subject'].toString();

                                        return new UpdatePage(
                                            s_name,
                                            s_id,
                                            s_age,
                                            s_contact,
                                            s_subject,
                                            document.documentID);
                                      }));
                                    },
                                  ),
                                  SizedBox(
                                    height: 14,
                                  ),
                                  RaisedButton(
                                    color: Colors.red,
                                    child: Text("Delete"),
                                    onPressed: () {
                                      delete(document.documentID);
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      );
                  }
                },
              )),
        ));
    //         void update() async {
    //   Firestore.instance
    //       .collection('bandnames')
    //       .document(widget.data.documentID)
    //       .setData({
    //     'name': nameFieldController.text,
    //     'votes': int.parse(voteFieldController.text)
    //   });
    //   Navigator.pop(context);
    // }
  }

  Widget CourseUi(
      String cname, String cid, String rating, String contributors) {
    return new Card(
      elevation: 30,
      margin: EdgeInsets.all(15),
      child: new Container(
        padding: new EdgeInsets.all(14),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  contributors + " Contributors",
                  style: Theme.of(context).textTheme.subtitle,
                  textAlign: TextAlign.center,
                ),
                new Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            new Text(cname),
            SizedBox(
              height: 20,
            ),
            new ListTile(
              trailing: Text(rating),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              child: Text(
                "hiiiiiiiiiiiiiiiii",
                style: TextStyle(color: Colors.pink),
              ),
              // color: Colors.green,
              //             child: new RaisedButton(
              //   elevation: 30,
              //   color: Colors.green,
              //   child: Text("View",style: TextStyle(color: Colors.white),),
              //   onPressed: (){
              //print("hiiiiiiiiiiiiiii");
              //   },
              // ),
            )
          ],
        ),
      ),
    );
  }
}
