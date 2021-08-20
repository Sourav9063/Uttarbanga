import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/AuthScreens/OTPscreen.dart';
import 'package:Uttarbanga/Screens/AuthScreens/ProfileScreen.dart';
import 'package:Uttarbanga/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseSignUp {
  static void resendOtp(int forceResendingToken, String phoneNumber) {
    try {
      FirebaseAuth.instance.verifyPhoneNumber(
          forceResendingToken: forceResendingToken,
          phoneNumber: phoneNumber,
          verificationCompleted: null,
          verificationFailed: null,
          codeSent: null,
          codeAutoRetrievalTimeout: null);
    } catch (e) {}
  }

  static void signUpWithPhoneCredintial(
      String verificationId, String smsCode, BuildContext context) async {
    try {
      PhoneAuthCredential phoneAuthCredential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: smsCode);
      await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
      if (FirebaseAuth.instance.currentUser != null) {
        if (FirebaseAuth.instance.currentUser.displayName != null ||
            FirebaseAuth.instance.currentUser.displayName == '') {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
              (Route<dynamic> route) => false);
        } else {
          Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(
                builder: (context) => ProfileScreen(),
              ),
              (Route<dynamic> route) => false);
        }
      } else {
        AllScaffoldKeys.otpScreen.currentState.showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("কিছু সমস্যা হয়েছে। আবার চেষ্টা করুন.")));
      }
    } catch (e) {
      AllScaffoldKeys.otpScreen.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(e.message ?? "কিছু সমস্যা হয়েছে। আবার চেষ্টা করুন")));
    }
  }

  static void signUpWithPhoneNumber(String number, BuildContext context) async {
    FocusScope.of(context).unfocus();
    AllScaffoldKeys.signUpScreen.currentState.showSnackBar(SnackBar(
      content: Text("$number নাম্বারে একটি OTP এসএমএস পাঠানো হচ্ছে।"),
      // duration: Duration(milliseconds: 200),
    ));
    try {
      print("StartTry");
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+88" + number,
        verificationCompleted: (phoneAuthCredential) async {
          print("verificationCompleted");
          try {
            await FirebaseAuth.instance
                .signInWithCredential(phoneAuthCredential);
            if (FirebaseAuth.instance.currentUser != null) {
              if (FirebaseAuth.instance.currentUser.displayName != null) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                    (Route<dynamic> route) => false);
              } else {
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(
                      builder: (context) => ProfileScreen(),
                    ),
                    (Route<dynamic> route) => false);
              }
            } else {
              AllScaffoldKeys.otpScreen.currentState.showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Text("কিছু সমস্যা হয়েছে। আবার চেষ্টা করুন.")));
            }
          } catch (e) {
            AllScaffoldKeys.otpScreen.currentState.showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                    Text(e.message ?? "কিছু সমস্যা হয়েছে। আবার চেষ্টা করুন")));
          }
        },
        verificationFailed: (FirebaseException e) {
          // print("Verification failed");
          // ScaffoldMessenger.of(context).showSnackBar(snackBar)
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
        timeout: Duration(seconds: 120),
        codeSent: (verificationId, forceResendingToken) {
          print("verificationCompleted Code sent");

          Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => OTPscreen(
                  phoneNumber: number,
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
