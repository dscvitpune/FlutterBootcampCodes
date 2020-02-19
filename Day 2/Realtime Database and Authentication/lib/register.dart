import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController controllerEmail, controllerPass;
  @override
  void initState() {
    super.initState();
    controllerEmail = TextEditingController();
    controllerPass = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      style: style,
      controller: controllerEmail,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: controllerPass,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final signUpButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: signUpWithEmailPass,
        child: Text("SignUp",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: new Center(
        child: new Column(
          children: <Widget>[emailField, passwordField, signUpButon],
        ),
      ),
    );
  }

  void signUpWithEmailPass() async {
    FirebaseUser user;
    try {
      user = (await auth.createUserWithEmailAndPassword(
          email: controllerEmail.text,
          password: controllerPass.text)) as FirebaseUser;
    } catch (e) {
      print(e);
    } finally {
      Toast.show("Registration Successful!", context);
      Navigator.pop(context);
    }
  }
}
