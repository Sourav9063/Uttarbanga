import 'package:Uttarbanga/Screens/AuthScreens/SignUpScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

MediaQueryData mq;
double ksch;
double kscw;

class Allkeys {
  static final String requestCol = 'RequestCollection';
  static final String adminCol = 'AdminKey';
  // static final String name = "nameKey";
  // static final String designation = "designationKey";
  // static final String department = "departmentKey";
  // static final String icNo = "icNoKey";
  // static final String address = "addressKey";
  // static final String zilla = "zillaKey";
  // static final String upazilla = "upazillaKey";
  // static final String phoneNumber = "phoneNumberKey";
  // static final String bloodType = "bloodTypeKey";
  // static final String joiningDate = "joiningDateKey";
  // static final String lprDate = "lprDateKey";
}

class AllScaffoldKeys {
  static final signUpScreen = GlobalKey<ScaffoldState>();
  static final otpScreen = GlobalKey<ScaffoldState>();
  static final profileScreen = GlobalKey<ScaffoldState>();
}

showSnackbarOnly(String title) {
  // SnackBar(content: Text(title));

  AllScaffoldKeys.signUpScreen.currentState
      .showSnackBar(SnackBar(content: Text(title)));
}

class CusCol {
  static final Color darkBack = Color(0xff000C18);
  static final Color lightBack = Color(0xffFFF5F3);
  static final Color fabC = Color(0xff40916c);
  static final Color dark2 = Color(0xff022730);
  static final Color dark1 = Color(0xff574165);
  static final Color light0 = Color(0xffA44D70);
  static final Color light1 = Color(0xffE16895);
  static final Color light2 = Color(0xffFF85A1);
  static final Color light3 = Color(0xffFEA1B3);
  static final Color light4 = Color(0xffFEAEA4);
  static final Color y0 = Color(0xffFDBBA5);
}

class AppData {
  static final String appName = "বৃহত্তর উত্তরবঙ্গ কল্যান সমিতি";
}

class UsefulFunc {
  static String timestampToString(Timestamp timestamp) {
    String date = timestamp.toDate().day.toString() +
        ' ' +
        getMonthName(timestamp.toDate().month) +
        ', ' +
        timestamp.toDate().year.toString();
    return date;
  }

  static List<String> monthName = [
    'Not availabel',
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  static getMonthName(int n) {
    return monthName[n];
  }

  static String id;
  static getSetMillisecondsId() {
    UsefulFunc.id = DateTime.now().millisecondsSinceEpoch.toString();
    return new DateTime.now().millisecondsSinceEpoch.toString();
  }

  static String timeToString(DateTime nowMil) {
    String uploaded = nowMil.day.toString() +
        ' ' +
        UsefulFunc.getMonthName(nowMil.month) +
        ', ' +
        nowMil.year.toString();
    return uploaded;
  }

  static bool isNumericUsingtryParse(String string) {
    // Null or empty string is not a number
    if (string == null || string.isEmpty) {
      return false;
    }

    // Try to parse input string to number.
    // Both integer and double work.
    // Use int.tryParse if you want to check integer only.
    // Use double.tryParse if you want to check double only.
    final number = num.tryParse(string);

    if (number == null) {
      return false;
    }

    return true;
  }

  static String engToBngNumber(String eng) {
    String bengali = '';
    for (int i = 0; i < eng.toString().length; i++) {
      switch (eng[i]) {
        case '1':
          bengali = bengali + '১';
          break;
        case '2':
          bengali = bengali + '২';
          break;
        case '3':
          bengali = bengali + '৩';
          break;
        case '4':
          bengali = bengali + '৪';
          break;
        case '5':
          bengali = bengali + '৫';
          break;
        case '6':
          bengali = bengali + '৬';
          break;
        case '7':
          bengali = bengali + '৭';
          break;
        case '8':
          bengali = bengali + '৮';
          break;
        case '9':
          bengali = bengali + '৯';
          break;
        default:
          bengali = bengali + '০';
      }
    }
    return bengali;
  }
}
