import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uiux/pages/home.dart';
import 'package:uiux/pages/homepage.dart';
import 'package:uiux/pages/intro.dart';
import 'package:uiux/pages/loginScreen.dart';
import 'package:uiux/pages/splashscreen.dart';
import 'package:uiux/pages/tasks.dart';

var routes = <String, WidgetBuilder>{
  "/homepage": (BuildContext context) => Home(),
//  "/signup": (BuildContext context) => SignUp(),
  "/homesig": (BuildContext context) => DashboardPage(),
  "/intro": (BuildContext context) => IntroScreen(),
};



void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        primarySwatch: Colors.purple,
        accentColor: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
      future: FirebaseAuth.instance.currentUser(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          FirebaseUser user = snapshot.data;
          return TasksPage(uid: user.uid);
        } else {
          return SplashScreen();
        }
      },
    );
  }
}
