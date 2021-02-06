import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/AuthScreens/ProfileScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseSignUp {
  static void signUpWithPhoneNumber(String number, BuildContext context) async {
    AllScaffoldKeys.signUpScreen.currentState
        .showSnackBar(SnackBar(content: Text("signUpstarted")));
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+88" + number,
        verificationCompleted: (phoneAuthCredential) async {
          await FirebaseAuth.instance.signInWithCredential(phoneAuthCredential);
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ));
        },
        verificationFailed: (FirebaseException e) {
          AllScaffoldKeys.signUpScreen.currentState
              .showSnackBar(SnackBar(content: Text(e.message)));
        },
        codeSent: (verificationId, forceResendingToken) {
          String smscode;
          AllScaffoldKeys.signUpScreen.currentState
              .showBottomSheet((context) => Container(
                    height: ksch * .3,
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            smscode = value;
                          },
                        ),
                        ElevatedButton(
                            onPressed: smscode == null || smscode == ""
                                ? () async {
                                    try {
                                      PhoneAuthCredential phoneAuthCredential =
                                          PhoneAuthProvider.credential(
                                              verificationId: verificationId,
                                              smsCode: smscode);
                                      await FirebaseAuth.instance
                                          .signInWithCredential(
                                              phoneAuthCredential);
                                    } catch (e) {
                                      Navigator.pop(context);
                                      AllScaffoldKeys.signUpScreen.currentState
                                          .showSnackBar(SnackBar(
                                              content:
                                                  Text("Not same sms code")));
                                    }
                                  }
                                : null,
                            child: Text("Verify code"))
                      ],
                    ),
                  ));
        },
        codeAutoRetrievalTimeout: (verificationId) {},
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
