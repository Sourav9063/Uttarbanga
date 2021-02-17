import 'dart:ui';

import 'package:Uttarbanga/GlobalVar.dart';
import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    // return ThemeData(
    //   primarySwatch: Colors.red,
    //   secondaryHeaderColor: isDarkTheme ? Colors.white : Color(0xff000C18),
    //   primaryColor: isDarkTheme ? Colors.black : Colors.white,
    //   backgroundColor: isDarkTheme ? Colors.black : Color(0xffF1F5FB),
    //   indicatorColor: isDarkTheme ? Color(0xff0E1D36) : Color(0xffCBDCF8),
    //   buttonColor: isDarkTheme ? Color(0xff3B3B3B) : Color(0xffF1F5FB),
    //   hintColor: isDarkTheme ? Color(0xff280C0B) : Color(0xffEECED3),
    //   highlightColor: isDarkTheme ? Color(0xff372901) : Color(0xffFCE192),
    //   hoverColor: isDarkTheme ? Color(0xff3A3A3B) : Color(0xff4285F4),
    //   focusColor: isDarkTheme ? Color(0xff0B2512) : Color(0xffA8DAB5),
    //   disabledColor: Colors.grey,
    //   textSelectionColor: isDarkTheme ? Colors.white : Colors.black,
    //   cardColor: isDarkTheme ? Color(0xFF151515) : Colors.white,
    //   canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
    //   brightness: isDarkTheme ? Brightness.dark : Brightness.light,
    //   buttonTheme: Theme.of(context).buttonTheme.copyWith(
    //       colorScheme: isDarkTheme ? ColorScheme.dark() : ColorScheme.light()),
    //   appBarTheme: AppBarTheme(
    //     elevation: 0.0,
    //   ),
    // );

    return !isDarkTheme
        ? ThemeData.light().copyWith(
            // brightness: Brightness.dark,
            snackBarTheme: SnackBarThemeData(
              backgroundColor: Colors.teal,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.vertical(
              //     top: Radius.circular(8),
              //   ),
              // ),
            ),
            accentColor: CusCol.light0,
            scaffoldBackgroundColor: CusCol.lightBack,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: CusCol.fabC),
            buttonTheme: ButtonTheme.of(context).copyWith(
              buttonColor: CusCol.y0,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              shape: StadiumBorder(),
            ))
        : ThemeData.dark().copyWith(
            snackBarTheme: SnackBarThemeData(
              backgroundColor: Colors.teal,
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.vertical(
              //     top: Radius.circular(8),
              //   ),
              // ),
            ),
            scaffoldBackgroundColor: CusCol.darkBack,
            floatingActionButtonTheme:
                FloatingActionButtonThemeData(backgroundColor: CusCol.fabC),
            brightness: Brightness.dark,
            accentColor: CusCol.light0,
            textTheme:
                ThemeData.dark().textTheme.apply(bodyColor: Colors.white),
            buttonTheme: ButtonTheme.of(context).copyWith(
              colorScheme: ColorScheme.highContrastDark(),
              buttonColor: CusCol.dark2,
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              shape: StadiumBorder(),
            ));
  }
}
