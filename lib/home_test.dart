import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:matrix/screens/home/home_screen.dart';

import 'authentication/login.dart';
import 'authentication/profile.dart';
import 'custom_nav_bar.dart';
import 'navigation_bottom_bar.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return Profile();
          } else if (snapshot.hasError) {
            return Center(
              child: Text("something went wrong "),
            );
          } else {
            return Login();
          }
        },
      ),
      // bottomNavigationBar: CustomNav(),
    );
  }
}
