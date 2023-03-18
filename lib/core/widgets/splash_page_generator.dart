import 'package:flutter/material.dart';
import 'package:plantopia/core/constants/constants.dart';

class SplashPageGenerator extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  const SplashPageGenerator({super.key, required this.image, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 50),
          //! Image Plant
          SizedBox(height: 350, child: Image.asset(image)),
          const SizedBox(height: 20),
          //! Title
          Text(
            title,
            style: const TextStyle(
              color: Constants.primaryColor,
              fontSize: 25,
              fontFamily: Constants.yekanBakh,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          //! Description
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Constants.blackColor.withOpacity(0.3),
              fontSize: 20,
              fontFamily: Constants.iranSans,
            ),
          ),
        ],
      ),
    );
  }
}
