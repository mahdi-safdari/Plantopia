import 'package:flutter/material.dart';
import 'package:plantopia/core/constants/constants.dart';

class PlantFeature extends StatelessWidget {
  final String title;
  final String plantFeature;
  const PlantFeature({Key? key, required this.title, required this.plantFeature}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(color: Constants.blackColor, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: Constants.lalezar),
        ),
        Text(
          plantFeature,
          style: const TextStyle(color: Constants.primaryColor, fontSize: 18.0, fontWeight: FontWeight.bold, fontFamily: Constants.lalezar),
        ),
      ],
    );
  }
}
