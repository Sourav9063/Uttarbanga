import 'package:Uttarbanga/GlobalVar.dart';
import 'package:flutter/material.dart';

class FlashScreen extends StatefulWidget {
  FlashScreen({Key key}) : super(key: key);

  @override
  _FlashScreenState createState() => _FlashScreenState();
}

class _FlashScreenState extends State<FlashScreen> {
  double _animatedPadding = kscw / 2 - 10;
  Alignment _animatedAlign = Alignment.center;
  double _animatePosh = ksch;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _animatedPadding = kscw * .2;
      _animatedAlign = Alignment.topCenter;
      _animatePosh = ksch * .7;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffffff),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedAlign(
              duration: Duration(milliseconds: 800),
              curve: Curves.fastOutSlowIn,
              alignment: _animatedAlign,
              child: AnimatedPadding(
                padding: EdgeInsets.symmetric(horizontal: _animatedPadding),
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeInSine,
                child: Image.asset(
                  "assets/img/logo.jpg",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            AnimatedPositioned(
                duration: Duration(milliseconds: 1000),
                curve: Curves.linearToEaseOut,
                top: _animatePosh,
                width: kscw,
                child: Container(
                  child: Center(
                    child: Text(
                     AppData.appName ,
                      style: Theme.of(context).textTheme.headline5.copyWith(
                            fontWeight: FontWeight.w300,
                            foreground: Paint()
                              ..blendMode = BlendMode.difference
                              ..color = Colors.white,
                          ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
