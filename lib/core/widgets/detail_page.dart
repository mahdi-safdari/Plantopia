import 'package:delayed_widget/delayed_widget.dart';
import 'package:flutter/material.dart';
import 'package:plantopia/core/constants/constants.dart';
import 'package:plantopia/core/widgets/extensions.dart';
import 'package:plantopia/core/widgets/model.dart';
import 'package:plantopia/core/widgets/plant_feature.dart';

class DetailPage extends StatefulWidget {
  final int plantId;
  const DetailPage({super.key, required this.plantId});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool toggleIsSelected(bool isSelected) {
    return !isSelected;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final List<Plant> plantList = Plant.plantList;
    final Plant data = plantList[widget.plantId];

    return Scaffold(
      body: Stack(
        children: <Widget>[
          //! AppBar
          Positioned(
            top: 50.0,
            left: 20.0,
            right: 20.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  //! X Button
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Constants.primaryColor.withOpacity(0.15)),
                    child: const Icon(Icons.close, color: Constants.primaryColor),
                  ),
                ),
                //! Like Button
                Container(
                  height: 40.0,
                  width: 40.0,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(50.0), color: Constants.primaryColor.withOpacity(0.15)),
                  child: Icon(data.isFavorated == true ? Icons.favorite : Icons.favorite_border, color: Constants.primaryColor),
                ),
              ],
            ),
          ),

          //! Detail bottom
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: DelayedWidget(
              animation: DelayedAnimations.SLIDE_FROM_BOTTOM,
              animationDuration: const Duration(seconds: 2),
              delayDuration: const Duration(seconds: 0),
              child: Container(
                padding: const EdgeInsets.only(top: 80.0, left: 30.0, right: 30.0),
                height: size.height * 0.5,
                width: size.width,
                decoration: BoxDecoration(
                  color: Constants.primaryColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(30.0), topLeft: Radius.circular(30.0)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        //! Star
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Icon(Icons.star, size: 30.0, color: Constants.primaryColor),
                            Text(
                              data.rating.toString().farsiNumber,
                              style: const TextStyle(fontFamily: Constants.lalezar, color: Constants.primaryColor, fontSize: 23.0),
                            ),
                          ],
                        ),
                        //! Plant Name
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              data.plantName,
                              style: const TextStyle(fontFamily: 'Lalezar', color: Constants.primaryColor, fontWeight: FontWeight.bold, fontSize: 30.0),
                            ),
                            const SizedBox(height: 10.0),
                            //! Price
                            Row(
                              children: <Widget>[
                                SizedBox(height: 19.0, child: Image.asset('assets/images/PriceUnit-green.png')),
                                const SizedBox(width: 10.0),
                                Text(
                                  data.price.toString().farsiNumber,
                                  style: const TextStyle(fontFamily: Constants.lalezar, color: Constants.blackColor, fontWeight: FontWeight.bold, fontSize: 24.0),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    //! Product Description
                    const SizedBox(height: 15.0),
                    Text(
                      data.decription,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontFamily: Constants.iranSans, color: Constants.blackColor.withOpacity(0.7), height: 1.6, fontSize: 18.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          //! Product Image
          Positioned(
            top: 120.0,
            left: 50.0,
            child: DelayedWidget(
              animation: DelayedAnimations.SLIDE_FROM_LEFT,
              animationDuration: const Duration(seconds: 2),
              delayDuration: const Duration(seconds: 0),
              child: SizedBox(
                height: 350.0,
                child: Image.asset(data.imageURL),
              ),
            ),
          ),
          //! Detail up
          Positioned(
            top: 100.0,
            left: 249.0,
            right: 20.0,
            child: DelayedWidget(
              animation: DelayedAnimations.SLIDE_FROM_RIGHT,
              animationDuration: const Duration(seconds: 2),
              delayDuration: const Duration(seconds: 0),
              child: Container(
                width: size.width * 0.2,
                height: size.height * 0.32,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Constants.primaryColor.withOpacity(0.1)),
                padding: const EdgeInsets.all(20.0),
                child: Stack(
                  children: <Widget>[
                    //! Plant Feature
                    Positioned(
                      top: 10.0,
                      right: 0.0,
                      child: SizedBox(
                        height: 200.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            PlantFeature(title: 'اندازه‌گیاه', plantFeature: data.size),
                            PlantFeature(title: 'رطوبت‌هوا', plantFeature: data.humidity.toString().farsiNumber),
                            PlantFeature(title: 'دمای‌نگهداری', plantFeature: data.temperature.toString().farsiNumber),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: SizedBox(
        width: size.width * 0.9,
        height: 50.0,
        child: Row(
          children: <Widget>[
            Container(
              height: 50.0,
              width: 50.0,
              decoration: BoxDecoration(
                color: Constants.primaryColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(50.0),
                boxShadow: <BoxShadow>[BoxShadow(offset: const Offset(0.0, 1.1), blurRadius: 5.0, color: Constants.primaryColor.withOpacity(0.3))],
              ),
              child: const Icon(Icons.shopping_cart, color: Colors.white),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: <BoxShadow>[BoxShadow(offset: const Offset(0.0, 1.1), blurRadius: 5.0, color: Constants.primaryColor.withOpacity(0.3))],
                ),
                child: Center(
                  child: InkResponse(
                    onTap: () {
                      setState(() {
                        bool isSelected = toggleIsSelected(data.isSelected);
                        data.isSelected = isSelected;
                      });
                    },
                    child: const Text(
                      'افزودن به سبد خرید',
                      style: TextStyle(fontFamily: Constants.lalezar, color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
