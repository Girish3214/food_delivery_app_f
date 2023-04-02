import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/foods/popular_food_details.dart';
import 'package:get/get.dart';

import './pages/home/main_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PopularFoodDetail(),
      debugShowCheckedModeBanner: false,
    );
  }
}
