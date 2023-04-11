import 'package:get/get.dart';

class Dimensions {
  static double screenHeight = Get.context!.height; //784
  static double screenWidth = Get.context!.width; // 410

  static double pageView = screenHeight / 2.45;

  static double pageViewContainer = screenHeight / 3.56;
  static double pageViewTextContainer = screenHeight / 6.53;

// dynamic height padding and margin
  static double height10 = screenHeight / 78.4;
  static double height15 = screenHeight / 52.2;
  static double height20 = screenHeight / 39.2;
  static double height30 = screenHeight / 26.13;
  static double height45 = screenHeight / 17.42;

// dynamic width padding and margin
  static double width10 = screenHeight / 78.4;
  static double width15 = screenHeight / 52.2;
  static double width20 = screenHeight / 39.2;
  static double width30 = screenHeight / 26.13;

// font sizes
  static double font16 = screenHeight / 49;
  static double font18 = screenHeight / 43.55;
  static double font20 = screenHeight / 39.2;
  static double font26 = screenHeight / 30.15;

  static double radius15 = screenHeight / 52.2;
  static double radius20 = screenHeight / 39.2;
  static double radius30 = screenHeight / 26.13;

  // icon size
  static double iconSize16 = screenHeight / 49;
  static double iconSize24 = screenHeight / 32.6;

  // List view size
  static double listViewImgSize = screenWidth / 3.41;
  static double listViewTextContainer = screenWidth / 4.10;

  // popular food
  static double popularFoodImgSize = screenHeight / 3.13;

  // bottom height
  static double bottomHeightBar = screenHeight / 6.53;
}
