import 'package:Uttarbanga/Backend/Auth/SignUpBackEnd.dart';
import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/FlashScreen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final _phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AllScaffoldKeys.signUpScreen,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.push(context, PageRouteBuilder(
      //       pageBuilder: (context, animation, secondaryAnimation) {
      //         return FlashScreen();
      //       },
      //     ));
      //   },
      // ),

      body: SingleChildScrollView(
        child: Container(
          height: ksch,
          width: kscw,
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // showSnackbarOnly(_phoneNumberController.text);

                      FirebaseSignUp.signUpWithPhoneNumber(
                          _phoneNumberController.text, context);
                    },
                    child: Text("VERIFY"),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
