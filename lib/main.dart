import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/AuthScreens/SignUpScreen.dart';
import 'package:Uttarbanga/Screens/FlashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color(0xff000C18)),
      home: ScreenSize(),
    );
  }
}

class ScreenSize extends StatelessWidget {
  ScreenSize({Key key}) : super(key: key);
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
            return SignUpScreen();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return FlashScreen();
        });
  }
}

class SomethingWentWrong extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Center(
        child: Icon(
          Icons.error,
        ),
      ),
    );
  }
}
