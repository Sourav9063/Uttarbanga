import 'dart:io';

import 'package:Uttarbanga/Backend/Data/sharedPref.dart';
import 'package:Uttarbanga/Components/Theme/ThemeBackEnd.dart';
import 'package:Uttarbanga/Components/Theme/ThemeDataCus.dart';
import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/AuthScreens/SignUpScreen.dart';
import 'package:Uttarbanga/Screens/FlashScreen.dart';
import 'package:Uttarbanga/Screens/ObBoarding.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Screens/ErrorScreen.dart';

// java -jar "C:\Users\USER\Downloads\Programs\bundletool-all-1.4.0.jar" build-apks --bundle="D:\Flutter app D exp\Uttarbanga\build\app\outputs\bundle\release\app-release.aab" --output=Uttarbanga.apks
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeChangeProvider = new DarkThemeProvider();
  bool onbvalue = false;
  @override
  void initState() {
    super.initState();
    getCurrentAppTheme();
    getOnBardingData();
  }

  void getOnBardingData() async {
    onbvalue = await OnboardingData.getOnbData();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => themeChangeProvider,
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) => MaterialApp(
          theme: Styles.themeData(themeChangeProvider.darkTheme, context),
          // darkTheme: ThemeData(
          //     brightness: Brightness.dark,
          //     scaffoldBackgroundColor: Color(0xff000C18)),
          home: ScreenSize(onb: onbvalue),
        ),
      ),
    );
  }
}

class ScreenSize extends StatelessWidget {
  ScreenSize({Key key, this.onb}) : super(key: key);
  final bool onb;
  final Future<FirebaseApp> _initialize = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    mq = MediaQuery.of(context);
    ksch = mq.size.height;
    kscw = mq.size.width;

    return FutureBuilder(
        future: _initialize,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return SomethingWentWrong();
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return onb ? Splash() : OnboardingScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return FlashScreen();
        });
  }
}
