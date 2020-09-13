import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:uiux/pages/loginScreen.dart';
import 'package:uiux/pages/splashscreen.dart';
import 'package:uiux/pages/tasks.dart';

class User_flow extends StatelessWidget {
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
