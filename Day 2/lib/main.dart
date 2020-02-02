import 'package:dsc_flutter_backend/anymSignIn.dart';
import 'package:dsc_flutter_backend/phone_auth.dart';
import 'package:dsc_flutter_backend/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authHome.dart';

void main() => runApp(MyAuthMain());

class MyAuthMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Auth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
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

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: loginWithEmailPass,
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text("Firebase Login"),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/dsc.png",
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(height: 45.0),
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                    new Center(
                        child: new Row(children: [
                      new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        icon: new Image.asset('assets/anon.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AnymPage()));
                        },
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        icon: new Image.asset('assets/otp.png'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PhoneAuth()));
                        },
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        icon: new Image.asset('assets/logo.png'),
                        onPressed: null,
                      ),
                      Padding(padding: EdgeInsets.all(10)),
                      new IconButton(
                        padding: new EdgeInsets.all(0.0),
                        icon: new Image.asset('assets/add.jpg'),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()));
                        },
                      )
                    ]))
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  void loginWithEmailPass() async {
    FirebaseUser user;
    try {
      var user = (await auth.signInWithEmailAndPassword(
              email: controllerEmail.text, password: controllerPass.text))
          .user;
      if (user.uid != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AuthHome(user.uid.toString())));
      }
    } catch (e) {
      print(e);
    } finally {}
  }

  _signOut() async {
    await _firebaseAuth.signOut();
  }
}
