import 'package:get/get.dart';

import '../pages/foods/popular_food_details.dart';
import '../pages/foods/recommended_food_details.dart';
import '../pages/home/main_home_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFoodDetails = "/popular-food-details";
  static const String recommendedFoodDetails = "/recommended-food-details";

  static String getInitial() => initial;
  static String getPopularFood(int pageId) =>
      "$popularFoodDetails?pageId=$pageId";
  static String getRecommendedFood() => recommendedFoodDetails;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const MainHomePage()),
    GetPage(
      name: popularFoodDetails,
      page: () {
        var pageId = Get.parameters["pageId"];
        return PopularFoodDetail(
          pageId: int.parse(pageId!),
        );
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: recommendedFoodDetails,
      page: () => const RecommendedFoodDetail(),
      transition: Transition.fadeIn,
    ),
  ];
}