import 'dart:async';

import 'package:Uttarbanga/Backend/Auth/SignUpBackEnd.dart';
import 'package:Uttarbanga/GlobalVar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPscreen extends StatefulWidget {
  OTPscreen(
      {Key key,
      @required this.verificationId,
      @required this.forceResendingToken,
      @required this.phoneNumber})
      : super(key: key);
  final String verificationId;
  final int forceResendingToken;
  final String phoneNumber;

  @override
  _OTPscreenState createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  TextEditingController _otpcontroller;

  bool visible = false;
  String time = "0";

  Timer timer;
  @override
  void initState() {
    super.initState();
    _otpcontroller = TextEditingController();
    stopWatch();
  }

  void stopWatch() {
    visible = false;
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      // print(t);
      if (t.tick == 120) {
        t.cancel();
        visible = true;
      }
      setState(() {
        time = UsefulFunc.engToBngNumber((120 - t.tick).toString());
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AllScaffoldKeys.otpScreen,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: kscw,
                    height: ksch * .32,
                    child: FlareActor(
                      "assets/flr/Otp.flr",
                      animation: "otp",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Center(
                      child: Text(
                    "মোবাইল নাম্বার যাচাই করণ",
                    style: Theme.of(context).textTheme.headline5,
                  )),
                ],
              ),

              Column(
                children: [
                  Center(
                      child: Text(
                    "${widget.phoneNumber} নাম্বারে একটি OTP পাঠানো হয়েছে।",
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  Center(
                      child: Text(
                    "এসএমএস থেকে ৬ ডিজিটের সংখ্যাটি লিখুন।",
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: PinCodeTextField(
                      autoDismissKeyboard: true,
                      controller: _otpcontroller,
                      backgroundColor: Colors.transparent,
                      pinTheme: PinTheme(
                        // activeColor: CusCol.dark1,
                        inactiveFillColor: CusCol.dark1,

                        selectedFillColor: Colors.blueAccent,
                        borderWidth: 1,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: kscw * .14,
                        fieldWidth: kscw * .1,
                        activeFillColor: Colors.white,
                      ),
                      keyboardType: TextInputType.number,
                      animationDuration: Duration(milliseconds: 500),
                      animationType: AnimationType.scale,
                      enableActiveFill: true,
                      appContext: context,
                      length: 6,
                      onChanged: (value) {
                        // print(value);
                      },
                      onCompleted: (value) async {
                        FirebaseSignUp.signUpWithPhoneCredintial(
                            widget.verificationId,
                            _otpcontroller.text,
                            context);
                      },
                      beforeTextPaste: (text) {
                        // print("Allowing to paste $text");
                        //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                        //but you can show anything you want here, like your pop up saying wrong paste format or etc
                        return true;
                      },
                    ),
                  ),
                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "এসএমএস পাননি?",
                    style: TextStyle(fontSize: 20),
                  ),
                  AnimatedSwitcher(
                    duration: Duration(
                      milliseconds: 400,
                    ),
                    switchInCurve: Curves.ease,
                    child: visible
                        ? Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // stopWatch();
                                // FirebaseSignUp.signUpWithPhoneNumber(
                                //     widget.phoneNumber, context);
                              },
                              child: Text(
                                "আবার চেষ্টা করুন",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.red,
                                    decoration: TextDecoration.underline),
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                            time + " সেকেন্ড অপেক্ষা করুন",
                            style: TextStyle(fontSize: 20),
                          )),
                  ),
                ],
              ),

              // Visibility(
              //   visible: !visible,
              //   child: Center(
              //       child: Text(
              //     time + " সেকেন্ড অপেক্ষা করুন",
              //     style: TextStyle(fontSize: 20),
              //   )),
              // ),
              // RaisedButton(
              //   onPressed: visible ? () {} : null,
              //   child: Text(
              //     "আবার চেষ্টা করুন",
              //     style: TextStyle(
              //         fontSize: 18,
              //         color: Colors.red,
              //         decoration: TextDecoration.underline),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
