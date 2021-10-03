import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:matrix/constat.dart/colors.dart';
import 'package:matrix/provider/main_provider.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  final String userName;
  final String userEmail;
  final File userPhoto;
  final String type;

  Profile({this.userName, this.userEmail, this.userPhoto, this.type});

  @override
  Widget build(BuildContext context) {
    // print("userName : ${userName}");
    // print("userEmail : ${userEmail}");
    // print("userPhoto : ${userPhoto}");
    // print("type : ${type}");
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "test call back data",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 80,
                  child: type != 'custom'
                      ? Image.network(user.photoURL)
                      : Image.file(
                          userPhoto,
                          fit: BoxFit.cover,
                        )),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(10)),
                child: type != 'custom'
                    ? Text(
                        'name : ' + user.displayName,
                        style: TextStyle(
                            color: secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        "name : " + userName,
                        style: TextStyle(
                            color: secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
              ),

              // Container(
              //   alignment: Alignment.center,
              //   margin: EdgeInsets.symmetric(vertical: 15),
              //   width: double.infinity,
              //   height: 200,
              //   decoration: BoxDecoration(
              //       color: primary,
              //       borderRadius: BorderRadius.circular(10)
              //   ),
              //   child: Text(
              //     'phone : '+ user.refreshToken,
              //     style: TextStyle(
              //         color: secondary,
              //         fontSize: 15,
              //         fontWeight: FontWeight.bold),
              //   ),
              // ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                    color: primary, borderRadius: BorderRadius.circular(10)),
                child: type != 'custom'
                    ? Text(
                        'mail : ' + user.email,
                        style: TextStyle(
                            color: secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    : Text(
                        'mail : ' + userEmail,
                        style: TextStyle(
                            color: secondary,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
              ),
              InkWell(
                  onTap: () {
                    final provider =
                        Provider.of<MainProvider>(context, listen: false);
                    provider.logout();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 200,
                    color: secondary,
                    child: Text(
                      "Log Out",
                      style: TextStyle(color: Colors.white),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
