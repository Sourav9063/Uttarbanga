import 'dart:io';

import 'package:Uttarbanga/Backend/Data/sharedPref.dart';
import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/AuthScreens/ProfileScreen.dart';
import 'package:Uttarbanga/Screens/AuthScreens/SignUpScreen.dart';
import 'package:Uttarbanga/Screens/ErrorScreen.dart';
import 'package:Uttarbanga/Screens/HomeScreen.dart';
import 'package:Uttarbanga/Screens/ObBoarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:splashscreen/splashscreen.dart';

class FlashScreen extends StatefulWidget {
  FlashScreen({Key key}) : super(key: key);

  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  double _animatedPadding = kscw / 2 - 10;
  Alignment _animatedAlign = Alignment.center;
  double _animatePosh = ksch;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animatedPadding = kscw * .2;
      _animatedAlign = Alignment.topCenter;
      _animatePosh = ksch * .7;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffffff),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 800),
              curve: Curves.fastOutSlowIn,
              alignment: _animatedAlign,
              child: AnimatedPadding(
                padding: EdgeInsets.symmetric(horizontal: _animatedPadding),
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInSine,
                child: Image.asset(
                  "assets/img/logo.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: Curves.linearToEaseOut,
                top: _animatePosh,
                width: kscw,
                child: Container(
                  child: Center(
                    child: Text(
                      AppData.appName,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w300,
                            foreground: Paint()
                              ..blendMode = BlendMode.difference
                              ..color = Colors.white,
                          ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => new _SplashState();
}

class _SplashState extends State<Splash> {
  Future<Widget> loadFromFuture() async {
    await Future.delayed(Duration(seconds: 1));
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        bool onbvalue = await OnboardingData.getOnbData();
        if (onbvalue) {
          if (FirebaseAuth.instance.currentUser == null) {
            return Future.value(SignUpScreen());
          } else {
            if (FirebaseAuth.instance.currentUser.displayName == null ||
                FirebaseAuth.instance.currentUser.displayName == '') {
              return Future.value(ProfileScreen());
            } else
              return Future.value(HomeScreen());
          }
        } else {
          return Future.value(OnboardingScreen());
        }
      }
    } on SocketException catch (_) {
      return Future.value(SomethingWentWrong(
        message: "ইন্টারনেট সংযোগ নেই",
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
        navigateAfterFuture: loadFromFuture(),
        title: new Text(
          AppData.appName,
          style: new TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20.0),
        ),
        
        image: new Image.asset(
          "assets/img/logo.jpg",
          fit: BoxFit.contain,
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Egypt"),
        loaderColor: Colors.red);
  }
}
