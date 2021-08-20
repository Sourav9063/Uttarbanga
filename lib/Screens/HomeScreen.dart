import 'dart:async';

import 'package:Uttarbanga/Components/Theme/ThemeBackEnd.dart';
import 'package:Uttarbanga/Components/Widgets/CompoundWidget.dart';
import 'package:Uttarbanga/Components/customAnimations/HeroPageRoute.dart';
import 'package:Uttarbanga/GlobalVar.dart';
import 'package:Uttarbanga/Screens/AuthScreens/SignUpScreen.dart';
import 'package:Uttarbanga/Screens/UserScreen.dart';
import 'package:Uttarbanga/Screens/zilla.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:concentric_transition/page_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import "dart:math" as math;

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _drawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        duration: Duration(milliseconds: 600),
        slideWidth: kscw * .65,
        borderRadius: 18,
        openCurve: Cubic(.8, 0, .2, 1),
        closeCurve: Cubic(.8, 0, .2, 1),
        controller: _drawerController,
        style: DrawerStyle.Style1,
        menuScreen: MenuePage(
          controller: _drawerController,
        ),
        mainScreen: MainScreen());
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final rtl = ZoomDrawer.isRTL();
    return ValueListenableBuilder<DrawerState>(
      valueListenable: ZoomDrawer.of(context).stateNotifier,
      builder: (context, state, child) {
        return AbsorbPointer(
          absorbing: state != DrawerState.closed,
          child: child,
        );
      },
      child: GestureDetector(
        child: HomePagePage(),
        onPanUpdate: (details) {
          if (details.delta.dx < 6 && !rtl || details.delta.dx < -6 && rtl) {
            ZoomDrawer.of(context).toggle();
          }
        },
      ),
    );
  }
}

class HomePagePage extends StatefulWidget {
  HomePagePage({Key key}) : super(key: key);

  @override
  _HomePagePageState createState() => _HomePagePageState();
}

class _HomePagePageState extends State<HomePagePage> {
  int _selectedIndex = 0;
  int _currentPage = 0;
  Timer t;
  final _pageController = PageController(viewportFraction: .75, initialPage: 1);
  @override
  void initState() {
    super.initState();
    t = Timer.periodic(Duration(seconds: 7), (timer) {
      if (_currentPage < AppData.appImageLink.length) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(_currentPage,
          duration: Duration(milliseconds: 1000), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    t.cancel();
    _pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.indigo,
        title: Row(
          children: [
            ClipOval(
                child: Hero(
              tag: "splashscreenImage",
              child: Image.asset(
                "assets/img/logo.jpg",
                height: 40,
              ),
            )),
            SizedBox(
              width: 4,
            ),
            Text(AppData.appName),
          ],
        ),
        leading: GestureDetector(
          child: Icon(Icons.menu),
          onTap: () {
            ZoomDrawer.of(context).open();
          },
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                height: kscw * 1.3,
                right: 0,
                // bottom: 0,
                child: SvgPicture.asset(
                  "assets/svg/RRBD.svg",
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    width: kscw * .95,
                    height: kscw,
                    child: GridView.count(
                      crossAxisCount: 3,
                      children: [
                        HomeIcons(
                          icon: FlutterIcons.my_location_mdi,
                          string: "উত্তরবঙ্গ",
                          function: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ZillaScreen(),
                                ));
                          },
                        ),
                        HomeIcons(
                          icon: FlutterIcons.users_faw,
                          string: "উপদেষ্টা মন্ডলী",
                        ),
                        HomeIcons(
                          icon: FlutterIcons.users_cog_faw5s,
                          string: "কার্য নির্বাহী কমিটি",
                        ),
                        HomeIcons(
                          icon: FlutterIcons.people_mdi,
                          string: "সিবিএ",
                        ),
                        HomeIcons(
                          icon: FlutterIcons.users_fea,
                          string: "সদস্যবৃন্দ",
                          function: () {
                            Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => UserList(),
                                ));
                          },
                        ),
                        HomeIcons(
                          icon: FlutterIcons.notification_ant,
                          string: "নোটিশ",
                        ),
                        HomeIcons(
                          icon: FlutterIcons.message_reply_text_mco,
                          string: "আলোচনা",
                        ),
                        HomeIcons(
                          icon: FlutterIcons.graph_bar_fou,
                          string: "আর্থিক অবস্থা",
                        ),
                        HomeIcons(
                          icon: FlutterIcons.feedback_mdi,
                          string: "পরামর্শ",
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: (ksch - kscw) * .5,
                    width: kscw,
                    child: Stack(
                      children: [
                        PageView.builder(
                            controller: _pageController,
                            itemCount: AppData.appImageLink.length,
                            itemBuilder: (context, index) => Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: AppData.appImageLink[index],
                                      errorWidget:
                                          (context, error, stackTrace) {
                                        return Center(
                                          child: Icon(
                                            Icons.error,
                                            color: Colors.red,
                                            size: kscw * .2,
                                          ),
                                        );
                                      },
                                      progressIndicatorBuilder:
                                          (context, url, downloadProgress) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                            value: downloadProgress.progress),
                                      ),
                                    ),
                                  ),
                                )),
                        Align(
                          alignment: Alignment(0, .8),
                          child: SmoothPageIndicator(
                              controller: _pageController,
                              effect: SwapEffect(
                                  // radius: 3,
                                  dotHeight: 8,
                                  dotColor: Colors.white54,
                                  activeDotColor: CusCol.light2),
                              count: AppData.appImageLink.length),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white24,
        padding: EdgeInsets.all(8),
        child: GNav(
          rippleColor: CusCol.dark1
              .withOpacity(.2), // tab button ripple color when pressed
          hoverColor: Colors.grey[700], // tab button hover color
          haptic: true, // haptic feedback
          tabBorderRadius: 300,
          tabActiveBorder: Border.all(
              color: Colors.grey.withOpacity(.3),
              width: 2), // tab button border
          tabBorder: Border.all(
              color: Colors.grey.withOpacity(.3),
              width: 2), // tab button border
          // tabShadow: [
          //   BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          // ], // tab button shadow
          curve: Cubic(.8, 0, .2, 1),
          // tab animation curves
          // curve: Curves.easeOutExpo,
          duration: Duration(milliseconds: 800), // tab animation duration
          gap: 6, // the tab button gap between icon and text
          // color: Colors.grey[800], // unselected icon color
          // activeColor:
          //     Colors.pinkAccent.shade400, // selected icon and text color
          // backgroundColor: Colors.red,

          iconSize: 24, // tab button icon size
          tabBackgroundColor: CusCol.light1, // selected tab background color
          padding: EdgeInsets.symmetric(
              horizontal: 20, vertical: 5), // navigation bar padding
          tabs: [
            GButton(
              icon: FlutterIcons.home_outline_mco,
              text: 'হোম',
            ),
            GButton(
              icon: FlutterIcons.heart_outline_mco,
              text: 'পছন্দ',
            ),
            GButton(
              icon: FlutterIcons.search_mdi,
              text: "সার্চ",
            ),
            GButton(
              icon: FlutterIcons.account_outline_mco,
              text: "প্রোফাইল",
            )
          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            print(index);
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class HomeIcons extends StatelessWidget {
  const HomeIcons({
    Key key,
    this.icon,
    this.string,
    this.function,
  }) : super(key: key);
  final IconData icon;
  final String string;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return GlassContainer.clearGlass(
      height: kscw / 4,
      width: kscw / 3.5,
      borderRadius: BorderRadius.circular(16),
      borderWidth: 3,
      blur: 6,
      color: Provider.of<DarkThemeProvider>(context).darkTheme
          ? Colors.blueGrey.shade400.withOpacity(.2)
          : Colors.pinkAccent.shade400.withOpacity(.3),
      // margin: EdgeInsets.all(5),
      // decoration: BoxDecoration(
      //     color: Colors.grey.withOpacity(.1),
      //     borderRadius: BorderRadius.circular(16),
      //     border: Border.all(color: Colors.grey.withOpacity(.3), width: 4)),
      child: InkWell(
        onTap: function ?? () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon ?? FlutterIcons.error_mdi,
              size: kscw / 8,
              color: Colors.white,
            ),
            Text(
              string ?? "নাম",
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}

class MenuePage extends StatefulWidget {
  MenuePage({Key key, @required this.controller}) : super(key: key);
  final ZoomDrawerController controller;

  @override
  _MenuePageState createState() => _MenuePageState();
}

class _MenuePageState extends State<MenuePage> {
  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: CusCol.dark1,
      body: SafeArea(
        child: Container(
          // color: CusCol.dark1,
          height: ksch,
          width: kscw,
          child: Stack(
            // overflow: Overflow.visible,
            // fit: StackFit.loose,
            children: [
              Positioned(
                left: -70,
                top: -89,
                child: ClipOval(
                  child: Container(
                    height: 550,
                    width: 550,
                    color: Colors.white.withOpacity(.1),
                  ),
                ),
              ),
              Positioned(
                left: -35,
                top: -69,
                child: ClipOval(
                  child: Container(
                    height: 350,
                    width: 350,
                    color: Colors.white.withOpacity(.2),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  //  color: CusCol.dark1,
                  height: ksch,
                  width: kscw * .65,

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            IconAccount(
                              id: "Profile",
                              padding: 8,
                              radious: kscw * .35,
                              imglink:
                                  FirebaseAuth.instance.currentUser.photoURL,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              FirebaseAuth.instance.currentUser.displayName,
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              FirebaseAuth.instance.currentUser.phoneNumber,
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 4,
                        indent: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "ডার্ক",
                            style: TextStyle(fontSize: 20),
                          ),
                          CupertinoSwitch(
                            trackColor: CusCol.y0,
                            activeColor: CusCol.light0,
                            value: themeChange.darkTheme,
                            onChanged: (value) {
                              themeChange.darkTheme = value;
                            },
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 4,
                        indent: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Option 1",
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.settings)
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Option 2",
                              style: TextStyle(fontSize: 18),
                            ),
                            Icon(Icons.settings)
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Option 3",
                            style: TextStyle(fontSize: 18),
                          ),
                          Icon(Icons.settings)
                        ],
                      ),
                      Divider(
                        thickness: 4,
                        indent: 8,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  left: kscw * .17,
                  bottom: 10,
                  child: OutlinedButton(
                    onPressed: () async {
                      await FirebaseAuth.instance.signOut();

                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (ctx) {
                        return SignUpScreen();
                      }));
                    },
                    child: Text(
                      "সাইন আউট",
                      style: TextStyle(fontSize: 18),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
