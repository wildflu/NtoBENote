import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yfalse/point_starts.dart';

import 'home_screen.dart';

void main() {
  runApp(const GetMaterialApp(
    home: MyApp(),
    title: "App",
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return const HomeScreen();
    return const PageStart();

  }
}