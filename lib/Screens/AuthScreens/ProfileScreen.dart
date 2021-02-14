import 'package:Uttarbanga/Backend/Data/UserData.dart';
import "package:Uttarbanga/GlobalVar.dart";
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: Container(
          height: ksch,
          width: kscw,
          child: Stack(
            children: [
              Positioned(
                top: ksch * .075,
                left: kscw * .05,
                child: Text(
                  "প্রোফাইল",
                  style: Theme.of(context).textTheme.headline4,
                ),
                
              ),
            ],
          ),
        ),
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
