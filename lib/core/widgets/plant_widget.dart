import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:plantopia/core/constants/constants.dart';
import 'package:plantopia/core/widgets/detail_page.dart';
import 'package:plantopia/core/widgets/extensions.dart';
import 'package:plantopia/core/widgets/model.dart';

class NewPlantWidget extends StatelessWidget {
  final List<Plant> _plantList;
  final int index;

  const NewPlantWidget({Key? key, required List<Plant> plantList, required this.index})
      : _plantList = plantList,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var data = _plantList[index];
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: DetailPage(plantId: data.plantId),
            type: PageTransitionType.size,
            alignment: Alignment.center,
            duration: const Duration(milliseconds: 300),
            reverseDuration: const Duration(milliseconds: 300),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(color: Constants.primaryColor.withOpacity(0.1), borderRadius: BorderRadius.circular(10.0)),
        height: 80.0,
        width: size.width,
        margin: const EdgeInsets.only(bottom: 10.0, top: 10.0),
        padding: const EdgeInsets.only(left: 10.0, top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              children: <Widget>[
                SizedBox(height: 20.0, child: Image.asset('assets/images/PriceUnit-green.png')),
                const SizedBox(width: 5.0),
                Text(
                  data.price.toString().farsiNumber,
                  style: const TextStyle(fontFamily: Constants.lalezar, color: Constants.primaryColor, fontSize: 20.0),
                ),
              ],
            ),
            Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: BoxDecoration(color: Constants.primaryColor.withOpacity(0.8), shape: BoxShape.circle),
                ),
                Positioned(
                  bottom: 5.0,
                  left: 0,
                  right: 0,
                  child: SizedBox(height: 80.0, child: Image.asset(data.imageURL)),
                ),
                Positioned(
                  bottom: 5.0,
                  right: 80.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(data.category, style: const TextStyle(fontSize: 13.0, fontFamily: Constants.yekanBakh)),
                      Text(
                        data.plantName,
                        style: const TextStyle(fontSize: 18.0, fontFamily: Constants.yekanBakh, color: Constants.blackColor),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
