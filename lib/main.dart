import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Calculator App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),


    );
  }
}
