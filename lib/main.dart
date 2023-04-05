import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './pages/home/main_home_page.dart';

import './helpers/dependencies.dart' as dep;
import './controllers/popular_product_controller.dart';
import './controllers/recommended_product_controller.dart';
import './routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductsList();
    Get.find<RecommendedProductController>().getPopularProductsList();
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainHomePage(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
    );
  }
}
