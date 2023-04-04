import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './pages/foods/popular_food_details.dart';
import './pages/foods/recommended_food_details.dart';
import './pages/home/main_home_page.dart';

import './helpers/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
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
      home: const MainHomePage(),
      debugShowCheckedModeBanner: false,
      routes: {
        PopularFoodDetail.routeName: (ctx) => const PopularFoodDetail(),
        RecommendedFoodDetail.routeName: (ctx) => const RecommendedFoodDetail(),
      },
    );
  }
}
