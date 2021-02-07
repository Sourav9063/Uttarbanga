import 'package:flutter/material.dart';

class OTPscreen extends StatefulWidget {
  OTPscreen(
      {Key key,
      @required this.verificationId,
      @required this.forceResendingToken})
      : super(key: key);
  final String verificationId;
  final int forceResendingToken;

  @override
  _OTPscreenState createState() => _OTPscreenState();
}

class _OTPscreenState extends State<OTPscreen> {
  TextEditingController _otpTextfieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextField(
                controller: _otpTextfieldController,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
                  fillColor: Color(0xff22fF3B),
                  
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10)),

                  // counter: Text(
                  //     _otpTextfieldController.text.length.toString() ?? "0")
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
