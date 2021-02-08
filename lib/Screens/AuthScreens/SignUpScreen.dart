import 'package:Uttarbanga/Backend/Auth/SignUpBackEnd.dart';
import 'package:Uttarbanga/Components/Theme/ThemeBackEnd.dart';
import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/FlashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  bool check = false;

  final _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      key: AllScaffoldKeys.signUpScreen,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return FlashScreen();
            },
          ));
        },
      ),
      body: AnimatedContainer(
        duration: Duration(milliseconds: 400),
        curve: Curves.fastLinearToSlowEaseIn,
        width: kscw,
        height: ksch - MediaQuery.of(context).viewInsets.bottom,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "ডার্ক",
                      style: TextStyle(fontSize: 20),
                    ),
                    CupertinoSwitch(
                      trackColor: CusCol.y0,
                      activeColor: CusCol.dark1,
                      value: themeChange.darkTheme,
                      onChanged: (value) {
                        themeChange.darkTheme = value;
                      },
                    ),
                  ],
                ),

                Center(
                  child: Text(
                    AppData.appName,
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),

                Container(
                  width: kscw,
                  height:
                      (ksch - MediaQuery.of(context).viewInsets.bottom) * .3,
                  child: Lottie.network(
                      "https://assets6.lottiefiles.com/packages/lf20_dyq0qz89/data.json",
                      
                      frameRate: FrameRate(60),
                      fit: BoxFit.contain,
                      reverse: true),
                ),
                // FlatButton(
                //     onPressed: () {
                //       themeChange.darkTheme = true;
                //     },
                //     child: Text("DARK")),
                // FlatButton(
                //     onPressed: () {
                //       themeChange.darkTheme = false;
                //     },
                //     child: Text("LIGHT")),
                Center(
                    child: Column(
                  children: [
                    Text(
                      "লগ ইন",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    Text(
                      "আপনার মোবাইল নাম্বারটি প্রদান করুন",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                )),

                PinCodeTextField(
                  autoDismissKeyboard: true,
                  controller: _phoneNumberController,
                  backgroundColor: Colors.transparent,
                  pinTheme: PinTheme(
                    // activeColor: CusCol.dark1,
                    inactiveFillColor: CusCol.dark1,

                    selectedFillColor: CusCol.light1,
                    borderWidth: 1,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: kscw * .12,
                    fieldWidth: kscw * .078,
                    activeFillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.phone,
                  animationDuration: Duration(milliseconds: 400),
                  animationType: AnimationType.scale,
                  enableActiveFill: true,
                  appContext: context,
                  length: 11,
                  onChanged: (value) {
                    // print(value);
                    if (value.length == 11)
                      check = true;
                    else
                      check = false;
                  },
                  // onCompleted: (value) {
                  //   print(value);
                  // },

                  validator: (value) {
                    check = false;
                    if (value == '')
                      return "আপনার মোবাইল নাম্বারটি প্রদান করুন";
                    else if (value[0] != '0')
                      return "মোবাইল নাম্বারটি ভুল হয়েছে। ০ দিয়ে শুরু হয়নি";
                    else if (!RegExp(r'^-?(([0-9]*)|(([0-9]*)\.([0-9]*)))$')
                        .hasMatch(value))
                      return "মোবাইল নাম্বারটি ভুল হয়েছে। শুধু মাত্র ০-৯ ব্যবহার হবে।";
                    else {
                      check = true;
                      return null;
                    }
                  },

                  beforeTextPaste: (text) {
                    // print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                ),
                RaisedButton(
                  onPressed: check
                      ? () {
                          // showSnackbarOnly(_phoneNumberController.text);
                          _formKey.currentState.validate();
                          FirebaseSignUp.signUpWithPhoneNumber(
                              _phoneNumberController.text, context);
                        }
                      : null,
                  child: Text("VERIFY"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
