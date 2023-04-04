import 'package:food_delivery_app/controllers/popular_product_controller.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../data/api/api_client.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "https"));

// Repositories
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

  // Controller
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));

}
