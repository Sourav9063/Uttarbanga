import 'package:Uttarbanga/Components/Theme/ThemeBackEnd.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:Uttarbanga/Backend/Data/MonthlyChadaData.dart';
import 'package:Uttarbanga/GlobalVar.dart';
import 'package:provider/provider.dart';

class ChadaPage extends StatefulWidget {
  ChadaPage({Key key}) : super(key: key);

  @override
  _ChadaPageState createState() => _ChadaPageState();
}

class _ChadaPageState extends State<ChadaPage> {
  List<MonthlyChadaData> monthlyChadaData = [
    MonthlyChadaData(
        chadaAmmount: 200.0,
        expiredDate: DateTime(2021, 7, 30),
        collectedAmount: 3000,
        totalAmount: 3000,
        nameOfMonth: UsefulFunc.getMonthNameBangla(1),
        status: "Done",
        totalMembers: 60),
    MonthlyChadaData(
        chadaAmmount: 200.0,
        expiredDate: DateTime(2021, 7, 30),
        collectedAmount: 3000,
        totalAmount: 3000,
        nameOfMonth: UsefulFunc.getMonthNameBangla(2),
        status: "Done",
        totalMembers: 60),
    MonthlyChadaData(
        chadaAmmount: 200.0,
        expiredDate: DateTime(2021, 7, 30),
        collectedAmount: 200,
        totalAmount: 3000,
        nameOfMonth: UsefulFunc.getMonthNameBangla(3),
        status: "Expired",
        totalMembers: 60),
    MonthlyChadaData(
        chadaAmmount: 200.0,
        expiredDate: DateTime(2021, 7, 30),
        collectedAmount: 2200,
        totalAmount: 3000,
        nameOfMonth: UsefulFunc.getMonthNameBangla(4),
        status: "Done",
        totalMembers: 60),
    MonthlyChadaData(
        chadaAmmount: 200.0,
        expiredDate: DateTime(2021, 7, 30),
        collectedAmount: 1000,
        totalAmount: 3200,
        nameOfMonth: UsefulFunc.getMonthNameBangla(5),
        status: "Pending",
        totalMembers: 60),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("চাঁদা"),
        // centerTitle: true,
        leading: Icon(Icons.arrow_back),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "ডার্ক",
                style: TextStyle(fontSize: 20),
              ),
              Consumer<DarkThemeProvider>(
                builder: (context, value, child) => CupertinoSwitch(
                  trackColor: CusCol.y0,
                  activeColor: CusCol.dark1,
                  value: value.darkTheme,
                  onChanged: (val) {
                    value.darkTheme = val;
                  },
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: ListView.builder(
          itemCount: monthlyChadaData.length,
          itemBuilder: (context, index) {
            String status = monthlyChadaData[index].status;
            Color color;
            if (status == "Done")
              color = Colors.green.shade900;
            else if (status == 'Expired')
              color = Colors.red.shade900;
            else if (status == "Pending") color = Colors.blue.shade900;
            return _MonthlyChada(
              monthlyChadaData: monthlyChadaData[index],
              color: color,
            );
          },
        ),
      ),
    );
  }
}

class _MonthlyChada extends StatelessWidget {
  const _MonthlyChada(
      {Key key, @required this.monthlyChadaData, this.color = Colors.amber})
      : super(key: key);
  final MonthlyChadaData monthlyChadaData;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).brightness == Brightness.light
          ? TextStyle(color: Colors.white)
          : TextStyle(color: Colors.black),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: RadialGradient(
            center: Alignment.topLeft,
            // stops: [.4, .2],
            colors: <Color>[
              // Color(0xffBA20F3),
              Theme.of(context).brightness == Brightness.light
                  ? Colors.black
                  : Colors.white.withOpacity(.8),

              // Color(0xff27C7F6),
              color,
              // color.withOpacity(.5),

              // monthlyChadaData.status == "Done"
              //     ? Colors.green.withOpacity(.1)
              //     : Colors.red.withOpacity(.1),
              // monthlyChadaData.status == "Done"
              //     ? Colors.green.withOpacity(.3)
              //     : Colors.red.withOpacity(.3),
            ],
            radius: 2.5,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        margin: EdgeInsets.only(bottom: 8),
        width: double.infinity,
        // height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  monthlyChadaData.nameOfMonth,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                Text(monthlyChadaData.status),
              ],
            ),
            Text("মাসের চাঁদা                 : " +
                UsefulFunc.engToBngNumber(
                    monthlyChadaData.chadaAmmount.floor().toString()) +
                " টাকা"),
            Text("জমাদানে শেষ তারিখ : " +
                UsefulFunc.engToBngNumber(
                    monthlyChadaData.expiredDate.day.toString()) +
                " " +
                UsefulFunc.getMonthNameBangla(
                    monthlyChadaData.expiredDate.month)),
            SizedBox(
              height: 8,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomAmountVisualize(
                      totalA: monthlyChadaData.totalAmount,
                      currentA: monthlyChadaData.collectedAmount,
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("জমাঃ " +
                            UsefulFunc.engToBngNumber(monthlyChadaData
                                .collectedAmount
                                .floor()
                                .toString()) +
                            " টাকা"),
                        Text("মোট চাঁদাঃ " +
                            UsefulFunc.engToBngNumber(monthlyChadaData
                                .collectedAmount
                                .floor()
                                .toString()) +
                            " টাকা")
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

class CustomAmountVisualize extends StatelessWidget {
  const CustomAmountVisualize({
    Key key,
    this.totalA = 0.0,
    this.currentA = 0.0,
  }) : super(key: key);
  final double totalA;
  final double currentA;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(300),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueGrey.withOpacity(.8),
          // border: Border.all(width: 2, color: Color(0xffFFFFFF)),
          borderRadius: BorderRadius.circular(300),
        ),
        height: 25,
        width: kscw * .9,
        child: Stack(
          children: [
            FadeInLeft(
              // duration: Duration(seconds: 1),
              delay: Duration(milliseconds: 200),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  // color: Color(0xff5A599C),
                  // color: Colors.amber
                  gradient: LinearGradient(
                    // center: Alignment.topLeft,
                    colors: <Color>[
                      Color(0xff1EACA4),
                      // Color(0xff1EACA4),
                      // Color(0xff593B95),
                      // CusCol.dark2
                      Colors.black
                      // monthlyChadaData.status == "Done"
                      //     ? Colors.green.withOpacity(.1)
                      //     : Colors.red.withOpacity(.1),
                      // monthlyChadaData.status == "Done"
                      //     ? Colors.green.withOpacity(.3)
                      //     : Colors.red.withOpacity(.3),
                    ],
                    // radius: 1,
                  ),
                ),
                width: kscw * .9 * (currentA / totalA),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
