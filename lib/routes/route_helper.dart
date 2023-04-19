import 'package:get/get.dart';

import '../pages/foods/popular_food_details.dart';
import '../pages/foods/recommended_food_details.dart';
import '../pages/home/home_page.dart';
import '../pages/cart/cart_page.dart';

class RouteHelper {
  static const String initial = "/";
  static const String popularFoodDetails = "/popular-food-details";
  static const String recommendedFoodDetails = "/recommended-food-details";
  static const String cartPage = "/cart-page";

  static String getInitial() => initial;
  static String getPopularFood(int pageId) =>
      "$popularFoodDetails?pageId=$pageId";
  static String getRecommendedFood(int pageId) =>
      "$recommendedFoodDetails?pageId=$pageId";
  static String getCartPage() => cartPage;

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => const HomePage()),
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
      page: () {
        var pageId = Get.parameters["pageId"];
        return RecommendedFoodDetail(pageId: int.parse(pageId!));
      },
      transition: Transition.fadeIn,
    ),
    GetPage(
        name: cartPage, page: () => CartPage(), transition: Transition.fadeIn),
  ];
}
