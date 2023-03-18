import 'package:flutter/material.dart';
import 'package:plantopia/core/constants/constants.dart';
import 'package:plantopia/core/widgets/splash_page_generator.dart';
import 'package:plantopia/screens/home_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int page = 0;
  final PageController pageController = PageController(initialPage: 0);
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! App Bar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 20.0, right: 20.0),
            child: InkWell(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Text(
                'رد کردن',
                style: TextStyle(color: Constants.blackColor.withOpacity(0.4), fontSize: 16, fontFamily: Constants.lalezar, fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //! Smooth Page Indicator
          Padding(
            padding: const EdgeInsets.only(left: 40),
            child: SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: ExpandingDotsEffect(
                dotHeight: 13,
                dotWidth: 13,
                spacing: 5,
                activeDotColor: Constants.primaryColor,
                dotColor: Constants.blackColor.withOpacity(0.25),
              ),
            ),
          ),
          //! Arrow Forward Button
          Padding(
            padding: const EdgeInsets.only(right: 10, bottom: 10),
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  if (page < 2) {
                    page++;
                    if (page < 3) {
                      pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    }
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                });
              },
              backgroundColor: Constants.primaryColor,
              child: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        ],
      ),
      //! Page View
      body: PageView(
        controller: pageController,
        onPageChanged: (int value) {
          setState(() {
            page = value;
          });
        },
        physics: const BouncingScrollPhysics(),
        children: const <Widget>[
          SplashPageGenerator(image: 'assets/images/plant-one.png', title: Constants.titleOne, description: Constants.descriptionOne),
          SplashPageGenerator(image: 'assets/images/plant-two.png', title: Constants.titleTwo, description: Constants.descriptionTwo),
          SplashPageGenerator(image: 'assets/images/plant-three.png', title: Constants.titleThree, description: Constants.descriptionThree),
        ],
      ),
    );
  }
}
