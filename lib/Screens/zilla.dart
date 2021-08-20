import 'package:Uttarbanga/GlobalVar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ZillaScreen extends StatefulWidget {
  ZillaScreen({Key key}) : super(key: key);

  @override
  _ZillaScreenState createState() => _ZillaScreenState();
}

class _ZillaScreenState extends State<ZillaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("উত্তরবঙ্গ"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            height: ksch * .25,
            width: kscw,
            decoration: BoxDecoration(
                color: Color(0xff2E6755).withOpacity(.5),
                borderRadius: BorderRadius.circular(12)),
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/R.svg",
                  height: kscw * .5,
                  width: kscw * .5,
                ),
                Positioned(
                  top: kscw * .18,
                  left: kscw * .18,
                  child: Text(
                    "রাজশাহী",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 28,
                  width: kscw * .45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "জেলার সংখ্যা        : ৮টি\nপৌরসভার সংখ্যা	  : ৫৯ টি\nউপজেলা সংখ্যা     : ৬৭ টি \nইউনিয়ন সংখ্যা       : ৫৬৪ টি\nগ্রাম সংখ্যা              : ১০৯১৪ টি\nসমিতির সদস্য        : **** জন\n"),
                      // Text("উপজেলার সংখ্যা: ৫৮\n"),
                      // Text(
                      //     "প্রধান প্রধান নদী:\nপদ্মা, যমুনা, আত্রাই, মহানন্দা, করতোয়া "),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            height: ksch * .25,
            width: kscw,
            decoration: BoxDecoration(
                color: Color(0xff559E84).withOpacity(.5),
                borderRadius: BorderRadius.circular(12)),
            child: Stack(
              children: [
                SvgPicture.asset(
                  "assets/svg/K.svg",
                  height: kscw * .5,
                  width: kscw * .5,
                ),
                Positioned(
                  top: kscw * .20,
                  left: kscw * .18,
                  child: Text(
                    "রংপুর",
                    style: Theme.of(context)
                        .textTheme
                        .headline5
                        .copyWith(color: Colors.white),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 28,
                  width: kscw * .45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "জেলার সংখ্যা        : ৮টি\nপৌরসভার সংখ্যা	  : ৩১ টি\nউপজেলা সংখ্যা     : ৫৮ টি \nইউনিয়ন সংখ্যা       : ৫৩৫ টি\nগ্রাম সংখ্যা              : ৯০৬৬ টি\nসমিতির সদস্য        : **** জন\n"),
                      // Text("উপজেলার সংখ্যা: ৬৭টি\n"),
                      // Text(
                      //     "প্রধান প্রধান নদী:\nপদ্মা, যমুনা, আত্রাই, মহানন্দা, করতোয়া "),
                      // "জেলার সংখ্যা: ৮ টি\nপৌরসভার সংখ্যা	: ৩১ টি\nউপজেলা সংখ্যা: ৫৮ টি \nইউনিয়ন সংখ্যা: ৫৩৫ টি\nগ্রাম সংখ্যা: ৯০৬৬ টি\nসমিতির সদস্য:**** জন\n"
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

// \nরাজশাহী, নাটোর, নওগাঁ, চাঁপাইনবাবগঞ্জ, পাবনা, সিরাজগঞ্জ, বগুড়া ও জয়পুরহাট\n
