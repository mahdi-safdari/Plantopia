import 'package:flutter/material.dart';
import 'package:plantopia/screens/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Plantopia',
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
