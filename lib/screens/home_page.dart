import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantopia/core/constants/constants.dart';
import 'package:plantopia/screens/cart_page.dart';
import 'package:plantopia/screens/favorite_page.dart';
import 'package:plantopia/screens/profile_page.dart';
import 'package:plantopia/screens/scan_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController(initialPage: 0);
  int bottomIndex = 0;
  List<Widget> page = <Widget>[
    HomePage(),
    FavoritePage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(color: Constants.blackColor, Icons.notifications, size: 30.0),
              Text(
                Constants.appBarTitle[bottomIndex],
                style: const TextStyle(color: Constants.blackColor, fontFamily: Constants.lalezar, fontSize: 24.0),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const ScanPage(),
              type: PageTransitionType.fade,
            ),
          );
        },
        backgroundColor: Constants.primaryColor,
        child: Image.asset('assets/images/code-scan-two.png', height: 30.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        splashColor: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        inactiveColor: Colors.black.withOpacity(0.5),
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.smoothEdge,
        leftCornerRadius: 30,
        rightCornerRadius: 30,
        icons: Constants.iconList,
        activeIndex: bottomIndex,
        onTap: (index) => setState(() => bottomIndex = index),
      ),
      extendBody: true,
    );
  }
}
