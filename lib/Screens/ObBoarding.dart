import 'package:Uttarbanga/Backend/Data/sharedPref.dart';
import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/FlashScreen.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageData {
  final String title;
  final String link;
  final IconData icon;
  final Color bgColor;
  final Color textColor;

  PageData({
    this.link,
    this.title,
    this.icon,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}

class OnboardingScreen extends StatelessWidget {
  final List<PageData> pages = [
    PageData(
      link: "https://assets10.lottiefiles.com/packages/lf20_5e7wgehs.json",
      icon: Icons.format_size,
      title: "রাজশাহী ও রংপুর বিভাগের ১৬ জেলার মানুষের প্লাটফর্ম",
      textColor: Colors.white,
      bgColor: Color(0xFFFDBFDD),
    ),
    PageData(
      link: "https://assets6.lottiefiles.com/private_files/lf30_ENCGkM.json",
      icon: Icons.hdr_weak,
      title: "এক ক্লিকেই সদস্য পরিচিতি",
      bgColor: Color(0xFFFFFFFF),
      textColor: Colors.white,
    ),
    PageData(
      icon: Icons.bubble_chart,
      title: "নিজের ও সমিতির চাঁদার হিসাব",
      link: "https://assets8.lottiefiles.com/packages/lf20_SyUX5x.json",
      bgColor: Color(0xFF0043D0),
      textColor: Colors.white,
    ),
    PageData(
      icon: Icons.bubble_chart,
      title: "সমিতির সকল নোটিশ",
      link: "https://assets8.lottiefiles.com/packages/lf20_U8MhmH.json",
      bgColor: Color(0xFF0043D0),
      textColor: Colors.white,
    ),
  ];

  // List<Color> get colors => pages.map((p) => p.bgColor).toList();
  final List<Color> colors = [
    CusCol.dark2,
    CusCol.dark1,
    CusCol.light0,
    CusCol.light1
  ];

  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ConcentricPageView(
            // reverse: false,
            colors: colors,
            pageController: _pageController,

//          opacityFactor: 1.0,
//          scaleFactor: 0.0,
            radius: 30,
            curve: Curves.ease,
            duration: Duration(seconds: 2),
//          verticalPosition: 0.7,
//          direction: Axis.vertical,
//          itemCount: pages.length,
//          physics: NeverScrollableScrollPhysics(),
            itemCount: pages.length,
            itemBuilder: (index, value) {
              PageData page = pages[index % pages.length];
              // For example scale or transform some widget by [value] param
              //            double scale = (1 - (value.abs() * 0.4)).clamp(0.0, 1.0);
              return Container(
                child: Theme(
                  data: ThemeData(
                    textTheme: TextTheme(
                      headline6: TextStyle(
                        color: page.textColor,
                        fontWeight: FontWeight.w600,
                        // fontFamily: 'Helvetica',
                        letterSpacing: 0.0,
                        fontSize: 17,
                      ),
                      subtitle2: TextStyle(
                        color: page.textColor,
                        fontWeight: FontWeight.w300,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  child: PageCard(page: page),
                ),
              );
            },
          ),
          Positioned(
            top: ksch * .07,
            right: 10,
            child: IconButton(
              onPressed: () async {
                // print("help");
                OnboardingData.setOnbData(true);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Splash(),
                    ),
                    (Route<dynamic> route) => false);
              },
              icon: Icon(
                Icons.close,
                color: Colors.white,
                size: kscw * .08,
              ),
            ),
          ),
          Positioned(
            left: (kscw * .5) - 25,
            top: ksch * .76,
            child: IgnorePointer(
              // ignoring: _pageController.page == (pages.length - 1),
              child: Icon(
                Icons.navigate_next_sharp,
                size: 50,
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: pages.length,
                  effect: SwapEffect(
                      dotColor: Colors.white, activeDotColor: CusCol.light2),
                ),
              ))
        ],
      ),
    );
  }
}

class PageCard extends StatelessWidget {
  final PageData page;

  const PageCard({
    Key key,
    @required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(
      //   horizontal: 30.0,
      // ),
      child: SafeArea(
        child: Stack(
          //        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // _buildPicture(context),
            _buildlottie(page.link),
            // SizedBox(height: 30),
            Align(alignment: Alignment(0, .25), child: _buildText(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildlottie(String link) {
    return Container(
        width: kscw, child: Lottie.network(link, fit: BoxFit.contain));
  }

  Widget _buildText(BuildContext context) {
    return Text(
      page.title,
      style: Theme.of(context).textTheme.headline6,
      textAlign: TextAlign.center,
    );
  }

//   Widget _buildPicture(
//     BuildContext context, {
//     double size = 190,
//     double iconSize = 170,
//   }) {
//     return Container(
//       width: size,
//       height: size,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.all(Radius.circular(60.0)),
//         color: page.bgColor
// //            .withBlue(page.bgColor.blue - 40)
//             .withGreen(page.bgColor.green + 20)
//             .withRed(page.bgColor.red - 100)
//             .withAlpha(90),
//       ),
//       margin: EdgeInsets.only(
//         top: 140,
//       ),
//       child: Stack(
//         fit: StackFit.expand,
//         children: <Widget>[
//           Positioned.fill(
//             child: RotatedBox(
//               quarterTurns: 2,
//               child: Icon(
//                 page.icon,
//                 size: iconSize + 20,
//                 color: page.bgColor
//                     .withBlue(page.bgColor.blue - 10)
//                     .withGreen(220),
//               ),
//             ),
//             right: -5,
//             bottom: -5,
//           ),
//           Positioned.fill(
//             child: RotatedBox(
//               quarterTurns: 5,
//               child: Icon(
//                 page.icon,
//                 size: iconSize + 20,
//                 color: page.bgColor.withGreen(66).withRed(77),
//               ),
//             ),
//           ),
//           Icon(
//             page.icon,
//             size: iconSize,
//             color: page.bgColor.withRed(111).withGreen(220),
//           ),
//         ],
//       ),
//     );
//   }
}
