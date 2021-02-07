import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/AuthScreens/OTPscreen.dart';
import 'package:Uttarbanga/Screens/AuthScreens/ProfileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseSignUp {
  static void signUpWithPhoneNumber(String number, BuildContext context) async {
    FocusScope.of(context).unfocus();
    AllScaffoldKeys.signUpScreen.currentState.showSnackBar(SnackBar(
      content: Text("Sending OTP to $number"),
      // duration: Duration(milliseconds: 200),
    ));
    try {
      print("StartTry");
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+88" + number,
        verificationCompleted: (phoneAuthCredential) async {
          print("verificationCompleted");
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ));
        },
        verificationFailed: (FirebaseException e) {
          print("Verification failed");
          AllScaffoldKeys.signUpScreen.currentState.showSnackBar(SnackBar(
            action: SnackBarAction(
              label: "OK",
              textColor: Colors.white,
              onPressed: () {
                AllScaffoldKeys.signUpScreen.currentState.hideCurrentSnackBar();
              },
            ),
            duration: Duration(seconds: 10),
            content: Text(
              e.message,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
            ),
            backgroundColor: Colors.red,
          ));
        },
        timeout: Duration(seconds: 60),
        codeSent: (verificationId, forceResendingToken) {
          print("verificationCompleted Code sent");

          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => OTPscreen(
                  verificationId: verificationId,
                  forceResendingToken: forceResendingToken,
                ),
              ));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          print("CodeAuto");
        },
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
