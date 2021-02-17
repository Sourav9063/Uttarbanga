import 'package:Uttarbanga/Backend/Data/UserData.dart';
import 'package:Uttarbanga/Components/Theme/ThemeBackEnd.dart';
import 'package:Uttarbanga/Components/Widgets/CompoundWidget.dart';
import 'package:Uttarbanga/Components/Widgets/TextFormfieldDecoration.dart';
import "package:Uttarbanga/GlobalVar.dart";
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserData _upf = UserData.placeholder();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    onPressed: () {},
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
                        child: Column(
                          children: [
                            CusTextFieldNew(
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
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FlatButton(
                                      shape: RoundedRectangleBorder(),
                                      padding: EdgeInsets.all(14),
                                      onPressed: () async {
                                        DateTime tmpTime = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2022),
                                          initialDatePickerMode:
                                              DatePickerMode.year,
                                        );

                                        print(tmpTime.toString());
                                        _upf.joiningDate =
                                            Timestamp.fromDate(tmpTime);
                                      },
                                      color: Colors.white12,
                                      child: Text("যোগদানের তারিখ")),
                                  FlatButton(
                                      shape: RoundedRectangleBorder(),
                                      padding: EdgeInsets.all(14),
                                      onPressed: () async {
                                        DateTime tmpTime = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime(2070),
                                          initialDatePickerMode:
                                              DatePickerMode.year,
                                        );

                                        print(tmpTime.toString());
                                        _upf.lprDate =
                                            Timestamp.fromDate(tmpTime);
                                      },
                                      color: Colors.white12,
                                      child: Text("এল.পি.আর. তারিখ")),
                                ],
                              ),
                              
                            ),
                            Row(children: [
                                
                              ],),
                            RaisedButton(onPressed: () {
                              print(_upf.toString());
                            })
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
}

class CusTextFieldNew extends StatelessWidget {
  final Function onChanged;
  final String suffixText;
  final String hintText;
  final Function onTap;

  const CusTextFieldNew(
      {Key key,
      @required this.onChanged,
      @required this.suffixText,
      @required this.hintText,
      this.onTap})
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
              onChanged: onChanged,
              onEditingComplete: () => FocusScope.of(context).nextFocus(),
              onTap: () {},
              decoration: kff.copyWith(hintText: hintText),

              // keyboardType: TextInputType.name,
            ),
          ),
        ],
      ),
    );
  }
}

//  TextEditingController _nameT = TextEditingController();
//   TextEditingController _designationT = TextEditingController();
//   TextEditingController _departmentT = TextEditingController();
//   TextEditingController _addressT = TextEditingController();
//   TextEditingController _upazillaT = TextEditingController();
//   TextEditingController _zillaT = TextEditingController();
// // TextEditingController _nameT=TextEditingController();
