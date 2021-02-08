import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/main.dart';
import 'package:flutter/material.dart';

class SomethingWentWrong extends StatelessWidget {
  final String message;

  const SomethingWentWrong(
      {Key key,
      this.message = "কিছু সমস্যার কারনে অ্যাপটিতে প্রবেশ করা যাচ্ছে না"})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.error,
              color: Colors.white,
              size: kscw * .3,
            ),
          ),
          Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenSize(),
                    ),
                    (Route<dynamic> route) => false);
              },
              child: Text(
                "আবার চেষ্টা করুন",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.underline),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
