import 'package:flutter/material.dart';
import 'package:plantopia/core/constants/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
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
          ],
        ),
      ),
    );
  }
}
