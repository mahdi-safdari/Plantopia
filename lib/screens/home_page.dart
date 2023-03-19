import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantopia/core/constants/constants.dart';
import 'package:plantopia/core/widgets/detail_page.dart';
import 'package:plantopia/core/widgets/extensions.dart';
import 'package:plantopia/core/widgets/model.dart';

import 'package:plantopia/core/widgets/plant_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  final List<Plant> _plantList = Plant.plantList;
  bool toggleIsFavorit(bool isFavorites) {
    return !isFavorites;
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            //! Search Box
            Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    showCursor: false,
                    style: const TextStyle(fontFamily: Constants.iranSans, fontSize: 14.0),
                    decoration: InputDecoration(
                      hintText: 'جستجو...',
                      fillColor: Constants.primaryColor.withOpacity(0.1),
                      filled: true,
                      prefixIcon: Icon(Icons.search, color: Constants.blackColor.withOpacity(0.6)),
                      suffixIcon: Icon(Icons.mic_rounded, color: Constants.blackColor.withOpacity(0.6)),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            //! Categories
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
              height: 70.0,
              width: size.width,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: Constants.plantTypes.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () => setState(() => selectedIndex = index),
                      child: Text(
                        Constants.plantTypes[index],
                        style: TextStyle(
                          fontFamily: Constants.iranSans,
                          fontSize: 16.0,
                          fontWeight: selectedIndex == index ? FontWeight.bold : FontWeight.w300,
                          color: selectedIndex == index ? Constants.primaryColor : Constants.blackColor,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //! Product One
            SizedBox(
              height: size.height * 0.3,
              child: ListView.builder(
                itemCount: _plantList.length,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                reverse: true,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: DetailPage(plantId: _plantList[index].plantId),
                          type: PageTransitionType.rotate,
                          alignment: Alignment.center,
                          duration: const Duration(milliseconds: 300),
                          reverseDuration: const Duration(milliseconds: 300),
                        ),
                      );
                    },
                    child: Container(
                      width: 200.0,
                      margin: const EdgeInsets.symmetric(horizontal: 18.0),
                      decoration: BoxDecoration(color: Constants.primaryColor.withOpacity(0.8), borderRadius: BorderRadius.circular(20.0)),
                      child: Stack(
                        children: <Widget>[
                          Positioned(
                            top: 10.0,
                            right: 20.0,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(50.0)),
                              child: IconButton(
                                onPressed: () {
                                  setState(() {
                                    bool isFavorited = toggleIsFavorit((_plantList[index].isFavorated));
                                    _plantList[index].isFavorated = isFavorited;
                                  });
                                },
                                icon: Icon(_plantList[index].isFavorated == true ? Icons.favorite : Icons.favorite_border_outlined, color: Constants.primaryColor, size: 20.0),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 50.0,
                            right: 50.0,
                            top: 50.0,
                            bottom: 50.0,
                            child: Image.asset(_plantList[index].imageURL),
                          ),
                          Positioned(
                            bottom: 15.0,
                            left: 20.0,
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20.0)),
                              child: Text(
                                r'$' + _plantList[index].price.toString().farsiNumber,
                                style: const TextStyle(
                                  color: Constants.primaryColor,
                                  fontSize: 16.0,
                                  fontFamily: Constants.lalezar,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 15.0,
                            right: 20.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  _plantList[index].category,
                                  style: const TextStyle(fontFamily: Constants.yekanBakh, color: Colors.white70, fontSize: 14.0),
                                ),
                                Text(
                                  _plantList[index].plantName,
                                  style: const TextStyle(fontFamily: Constants.yekanBakh, color: Colors.white70, fontSize: 16.0, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            //! New Plants - Text
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 18.0, bottom: 15.0, top: 20.0),
              child: const Text(
                'گیاهان جدید',
                style: TextStyle(fontFamily: Constants.lalezar, fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),

            //! New Plants - Product 2
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              height: size.height * 0.5,
              child: ListView.builder(
                itemCount: _plantList.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return NewPlantWidget(plantList: _plantList, index: index);
                },
              ),
            ),
            //! Space
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
