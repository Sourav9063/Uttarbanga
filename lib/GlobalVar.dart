import 'package:Uttarbanga/Screens/AuthScreens/SignUpScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

MediaQueryData mq;
double ksch;
double kscw;

class Allkeys {
  static final String memberCol = 'MemberKey';
  static final String adminCol = 'AdminKey';
}

class AllScaffoldKeys {
  static final signUpScreen = GlobalKey<ScaffoldState>();
}

showSnackbarOnly(String title) {
  // SnackBar(content: Text(title));

  AllScaffoldKeys.signUpScreen.currentState
      .showSnackBar(SnackBar(content: Text(title)));
}
