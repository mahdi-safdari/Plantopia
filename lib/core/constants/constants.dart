import 'package:flutter/material.dart';
import 'package:plantopia/screens/cart_page.dart';
import 'package:plantopia/screens/favorite_page.dart';
import 'package:plantopia/screens/home_page.dart';
import 'package:plantopia/screens/profile_page.dart';

class Constants {
  static const Color primaryColor = Color(0xFF296E48);
  static const Color blackColor = Colors.black54;
  static const String iranSans = "iranSans";
  static const String lalezar = "Lalezar";
  static const String yekanBakh = "YekanBakh";
  static const String titleOne = "گیاهان را بهتر از قبل درک کن";
  static const String descriptionOne = "در مورد نگه داری گل و گیاهان میتوانی اطلاعات کسب کنی";
  static const String titleTwo = "با گیاهان جدید آشنا شو";
  static const String descriptionTwo = "رز مشکی یا گل رز دوست داری؟ اینجا میتونی پیداش کنی";
  static const String titleThree = "با یک گل بهار نمیشود، گل بکار";
  static const String descriptionThree = "هر گلی نیاز داشته باشید در این اپلیکیشن پیدا میکنید";
  static const List<String> appBarTitle = <String>['خانه', 'علاقه‌مندی‌ها', 'سبد‌خرید', 'پروفایل'];
  static const List<IconData> iconList = <IconData>[Icons.home, Icons.favorite, Icons.shopping_cart, Icons.person];

  static List<Widget> pages() {
    return const <Widget>[
      HomePage(),
      FavoritePage(),
      CartPage(),
      ProfilePage(),
    ];
  }
}
