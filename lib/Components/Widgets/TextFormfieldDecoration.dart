import 'package:flutter/material.dart';

import '../../GlobalVar.dart';

class CusTextField {
  static InputDecoration getDecoration(String iconText, String hintText) {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      fillColor: Colors.white12,
      filled: true,
      border: InputBorder.none,
      hintText: hintText,

      // // isCollapsed: true,
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.circular(100),
      // ),
      disabledBorder: InputBorder.none,
      enabledBorder: InputBorder.none,
      errorBorder: OutlineInputBorder(
        gapPadding: 10,
        borderRadius: BorderRadius.circular(30),
      ),
      // focusedBorder: InputBorder.none,
      focusedBorder: OutlineInputBorder(
        gapPadding: 10,
        borderRadius: BorderRadius.circular(30),
        borderSide: BorderSide(color: Colors.teal),
      ),
      focusColor: Colors.tealAccent,
      icon: Text(
        iconText,
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}

final kff = InputDecoration(
  contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
  fillColor: Colors.white12,
  filled: true,
  border: InputBorder.none,
  hintText: "hintText",

  // // isCollapsed: true,
  // border: OutlineInputBorder(
  //   borderRadius: BorderRadius.circular(100),
  // ),
  disabledBorder: InputBorder.none,
  enabledBorder: InputBorder.none,
  errorBorder: OutlineInputBorder(
    gapPadding: 10,
    borderRadius: BorderRadius.circular(30),
  ),
  // focusedBorder: InputBorder.none,
  focusedBorder: OutlineInputBorder(
    gapPadding: 10,
    borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(color: Colors.teal),
  ),
  focusColor: Colors.tealAccent,
);
