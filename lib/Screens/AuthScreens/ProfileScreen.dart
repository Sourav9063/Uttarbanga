import 'package:Uttarbanga/Backend/Data/UserData.dart';
import 'package:Uttarbanga/Backend/Firestore/firestore.dart';
import 'package:Uttarbanga/Backend/Img/profilePic.dart';

import 'package:Uttarbanga/Components/Widgets/CompoundWidget.dart';
import 'package:Uttarbanga/Components/Widgets/TextFormfieldDecoration.dart';
import 'package:Uttarbanga/Components/Widgets/bluredDialog.dart';
import "package:Uttarbanga/GlobalVar.dart";
import 'package:Uttarbanga/Screens/HomeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserData _upf = UserData.placeholder();
  TextEditingController joiningTEC = TextEditingController();
  TextEditingController lprTEC = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  User user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    super.initState();
    _upf.phoneNumber = user.phoneNumber;
    _upf.uid = user.uid;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: AllScaffoldKeys.profileScreen,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              // bottom: MediaQuery.of(context).viewInsets.bottom,
              bottom: 0,
              top: ksch * .25,
              left: 0,
              right: 0,
              child: Material(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(22),
                ),
                // margin: EdgeInsets.all(8),

                color: CusCol.dark1,
              ),
            ),
            Positioned(
              top: ksch * .1,
              right: kscw / 2 - ksch * .25 / 2,
              child: IconAccount(
                radious: ksch * .25,
                imglink: _upf.imageLink,
              ),
            ),
            Positioned(
                right: kscw * .25,
                top: ksch * .28,
                child: Material(
                  borderRadius: BorderRadius.circular(400),
                  color: CusCol.light1,
                  child: IconButton(
                    color: Colors.white,
                    iconSize: kscw * .11,
                    onPressed: () async {
                      customDiologue(context);
                    },
                    icon: Icon(Icons.add_a_photo_outlined),
                  ),
                )),
            Align(
              alignment: Alignment.topCenter,
              // top: ksch * .075,
              // left: kscw * .05,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "প্রোফাইল",
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
            Positioned(
                top: ksch * .38,
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  // height: ksch * .62,
                  // color: Colors.white70,
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _formkey,
                        child: Column(
                          children: [
                            CusTextFieldNew(
                                validate: (value) {
                                  print(value);
                                  if (value == null || value == '')
                                    return 'অবশ্যই আপনার নাম দিতে হবে!';
                                  return null;
                                },
                                onChanged: (value) => _upf.name = value,
                                suffixText: "নাম",
                                hintText: "আপনার নাম"),
                            CusTextFieldNew(
                                onChanged: (value) => _upf.designation = value,
                                suffixText: "পদবি",
                                hintText: "আপনার পদবি"),
                            CusTextFieldNew(
                                onChanged: (value) => _upf.department = value,
                                suffixText: "বিভাগ",
                                hintText: "আপনার বিভাগ"),
                            CusTextFieldNew(
                                onChanged: (value) => _upf.icNo = value,
                                suffixText: "আইসি নং",
                                hintText: "আইডেনটিফিকেশন নাম্বার"),
                            CusTextFieldNew(
                                onChanged: (value) => _upf.upazilla = value,
                                suffixText: "উপজেলা",
                                hintText: "আপনার উপজেলা"),
                            CusTextFieldNew(
                                onChanged: (value) => _upf.zilla = value,
                                suffixText: "জেলা",
                                hintText: "আপনার জেলা"),
                            CusTextFieldNew(
                              suffixText: "ঠিকানা",
                              hintText: "আপনার বাসার ঠিকানা",
                              onChanged: (value) => _upf.address = value,
                            ),
                            // Padding(
                            //   padding: const EdgeInsets.all(8.0),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceEvenly,
                            //     children: [
                            //       FlatButton(
                            //           shape: RoundedRectangleBorder(),
                            //           padding: EdgeInsets.all(14),
                            //           onPressed: () async {
                            //             DateTime tmpTime = await showDatePicker(
                            //               context: context,
                            //               initialDate: DateTime.now(),
                            //               firstDate: DateTime(1900),
                            //               lastDate: DateTime(2022),
                            //               initialDatePickerMode:
                            //                   DatePickerMode.year,
                            //             );

                            //             print(tmpTime.toString());
                            //             _upf.joiningDate =
                            //                 Timestamp.fromDate(tmpTime);
                            //           },
                            //           color: Colors.white12,
                            //           child: Text("যোগদানের তারিখ")),
                            //       FlatButton(
                            //           shape: RoundedRectangleBorder(),
                            //           padding: EdgeInsets.all(14),
                            //           onPressed: () async {
                            //             DateTime tmpTime = await showDatePicker(
                            //               context: context,
                            //               initialDate: DateTime.now(),
                            //               firstDate: DateTime(1950),
                            //               lastDate: DateTime(2070),
                            //               initialDatePickerMode:
                            //                   DatePickerMode.year,
                            //             );

                            //             print(tmpTime.toString());
                            //             _upf.lprDate =
                            //                 Timestamp.fromDate(tmpTime);
                            //           },
                            //           color: Colors.white12,
                            //           child: Text("এল.পি.আর. তারিখ")),
                            //     ],
                            //   ),
                            // ),
                            CusTextFieldDate(
                                controller: joiningTEC,
                                onTap: () async {
                                  DateTime tmpTime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2070),
                                    initialDatePickerMode: DatePickerMode.year,
                                  );

                                  print(tmpTime.toString());
                                  joiningTEC.text = UsefulFunc.engToBngNumber(
                                      tmpTime.toString().replaceRange(
                                          tmpTime.toString().indexOf(" "),
                                          tmpTime.toString().length,
                                          ''));
                                  _upf.joiningDate =
                                      Timestamp.fromDate(tmpTime);
                                },
                                onChanged: (value) {},
                                hintText: "তারিখ",
                                suffixText: "যোগদানের তারিখ"),
                            CusTextFieldDate(
                                controller: lprTEC,
                                onTap: () async {
                                  print("Tap");
                                  DateTime tmpTime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime(2070),
                                    initialDatePickerMode: DatePickerMode.year,
                                  );
                                  lprTEC.text = UsefulFunc.engToBngNumber(
                                      tmpTime.toString().replaceRange(
                                          tmpTime.toString().indexOf(" "),
                                          tmpTime.toString().length,
                                          ''));
                                  // print(tmpTime.toString());
                                  _upf.lprDate = Timestamp.fromDate(tmpTime);
                                  // print(_upf.lprDate.toString());
                                },
                                onChanged: null,
                                hintText: "তারিখ",
                                suffixText: "এল.পি.আর. তারিখ"),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "রক্তের গ্রুপ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18),
                                  ),
                                  Container(
                                      width: kscw * .55,
                                      // color: Colors.white12,
                                      child: DropdownButtonFormField(
                                        validator: (value) {
                                          if (value == null)
                                            return "আপনার রক্তের গ্রুপ দিন";
                                          return null;
                                        },
                                        dropdownColor: Colors.black54,
                                        onChanged: (String newValue) {
                                          setState(() {
                                            _upf.bloodType = newValue;
                                          });
                                        },
                                        decoration: kff.copyWith(
                                            hintText: "আপনার রক্তের গ্রুপ"),
                                        value: _upf.bloodType,
                                        // hint: Text("  আপনার রক্তের গ্রুপ"),
                                        items: <String>[
                                          'এ+',
                                          'এ-',
                                          'বি+',
                                          'বি-',
                                          'ও+',
                                          'ও-',
                                          "জানা নেই"
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18)),
                                          );
                                        }).toList(),
                                      )),
                                ],
                              ),
                            ),

                            RaisedButton(
                              onPressed: () async {
                                print(_upf.toString());

                                if (_formkey.currentState.validate()) {
                                  if (_upf.imageLink == null) {
                                    //open image update page
                                    AllScaffoldKeys.profileScreen.currentState
                                        .showSnackBar(SnackBar(
                                      content: Text('একটি ছবি যোগ করুন'),
                                      backgroundColor: Colors.red,
                                    ));
                                    await customDiologue(context);
                                  } else {
                                    try {
                                      await UttarbangaFirestoreReq()
                                          .setDocumentwithUID(
                                              user.uid, _upf.toMap());

                                  await    user.updateProfile(
                                          displayName: _upf.name,
                                          photoURL: _upf.imageLink);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => HomeScreen(),
                                          ),
                                          (Route<dynamic> route) => false);
                                    } catch (e) {
                                      AllScaffoldKeys.profileScreen.currentState
                                          .showSnackBar(SnackBar(
                                        content: Text(
                                            'কিছু যান্ত্রিক ত্রুটি হচ্ছে। আবার চেষ্টা করুন'),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
                                  }
                                }
                              },
                              child: Center(
                                child: Text("জমা দিন"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  customDiologue(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => BlurredDialog(
        height: ksch * .3,
        width: kscw * .85,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('একটি ছবি বাছাই করুন',
                style: TextStyle(color: Colors.white, fontSize: 25)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.add_a_photo_rounded,
                          size: kscw * .1,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          try {
                            _upf.imageLink = await UploadIMG()
                                .uploadProfilePic(user.phoneNumber, true);
                            setState(() {});
                            AllScaffoldKeys.profileScreen.currentState
                                .showSnackBar(SnackBar(
                              content: Text('ছবি সফল ভাবে সংরক্ষণ হয়েছে'),
                              backgroundColor: Colors.green,
                            ));
                            Navigator.pop(context);
                          } catch (e) {
                            AllScaffoldKeys.profileScreen.currentState
                                .showSnackBar(SnackBar(
                              content: Text(
                                  'কিছু যান্ত্রিক ত্রুটি হচ্ছে। আবার চেষ্টা করুন'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }),
                    Text(" ক্যামেরা",
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(
                          Icons.add_photo_alternate_rounded,
                          size: kscw * .1,
                          color: Colors.white,
                        ),
                        onPressed: () async {
                          try {
                            _upf.imageLink = await UploadIMG()
                                .uploadProfilePic(user.phoneNumber, false);
                            setState(() {});
                            AllScaffoldKeys.profileScreen.currentState
                                .showSnackBar(SnackBar(
                              content: Text('ছবি সফল ভাবে সংরক্ষণ হয়েছে'),
                              backgroundColor: Colors.green,
                            ));
                            Navigator.pop(context);
                          } catch (e) {
                            AllScaffoldKeys.profileScreen.currentState
                                .showSnackBar(SnackBar(
                              content: Text(
                                  'কিছু যান্ত্রিক ত্রুটি হচ্ছে। আবার চেষ্টা করুন'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }),
                    Text("গ্যালারি",
                        style: TextStyle(color: Colors.white, fontSize: 18))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CusTextFieldNew extends StatelessWidget {
  final Function onChanged;
  final Function validate;
  final String suffixText;
  final String hintText;
  final Function onTap;

  const CusTextFieldNew(
      {Key key,
      @required this.onChanged,
      @required this.suffixText,
      @required this.hintText,
      this.onTap,
      this.validate})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            suffixText,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Container(
            width: kscw * .75,
            child: TextFormField(
              style: TextStyle(color: Colors.white, fontSize: 16),
              validator: validate ??
                  (value) {
                    if (value == null || value == '')
                      return 'অবশ্যই আপনার $suffixText দিতে হবে!';
                    return null;
                  },
              onChanged: onChanged,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              onTap: onTap,
              decoration: kff.copyWith(hintText: hintText),

              // keyboardType: TextInputType.name,
            ),
          ),
        ],
      ),
    );
  }
}

class CusTextFieldDate extends StatelessWidget {
  final Function onChanged;
  final Function validate;
  final String suffixText;
  final String hintText;
  final Function onTap;
  final TextEditingController controller;

  const CusTextFieldDate(
      {Key key,
      @required this.onChanged,
      @required this.suffixText,
      @required this.hintText,
      this.onTap,
      this.validate,
      @required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            suffixText,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          Container(
            width: kscw * .55,
            child: TextFormField(
              style: TextStyle(color: Colors.white, fontSize: 16),
              validator: validate ??
                  (value) {
                    if (value == null || value == '')
                      return 'অবশ্যই আপনার $suffixText দিতে হবে!';
                    return null;
                  },
              autofocus: false,
              controller: controller,
              readOnly: true,
              // validator: validate,
              onChanged: onChanged,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              onTap: onTap,
              decoration: kff.copyWith(hintText: hintText),

              // keyboardType: TextInputType.name,
            ),
          ),
        ],
      ),
    );
  }
}

//   TextEditingController _departmentT = TextEditingController();
//   TextEditingController _addressT = TextEditingController();
//   TextEditingController _upazillaT = TextEditingController();
//   TextEditingController _zillaT = TextEditingController();
// // TextEditingController _nameT=TextEditingController();
