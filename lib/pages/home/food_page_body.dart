import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:food_delivery_app/controllers/recommended_product_controller.dart';
import 'package:get/get.dart';

import '../../modals/product_modal.dart';
import '../../pages/foods/popular_food_details.dart';
import '../../pages/foods/recommended_food_details.dart';
import '../../routes/route_helper.dart';
import '../../utils/app_constants.dart';
import '../../utils/dimensions.dart';

import '../../utils/colors.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../../widgets/icon_and_text.dart';
import '../../widgets/app_column.dart';

import '../../controllers/popular_product_controller.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({super.key});

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  final _scaleFactor = 0.8;

  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  Widget _buildPageItems(int index, ProductModel popularProduct) {
    Matrix4 matrix = Matrix4.identity();

// for scrolling effect in the main pain i.e. carasoul
    if (index == _currPageValue.floor()) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() + 1) {
      var currScale =
          _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1);
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currPageValue.floor() - 1) {
      var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: GestureDetector(
        onTap: () {
          Get.toNamed(RouteHelper.getPopularFood(index));
        },
        child: Stack(
          children: <Widget>[
            Container(
              height: Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.radius30),
                color: index.isEven
                    ? const Color(0xFFffd379)
                    : const Color(0xFF69c5df),
                image: DecorationImage(
                  image: NetworkImage(AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      popularProduct.img!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.pageViewTextContainer,
                margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height30,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(5, 0),
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-5, 0),
                      ),
                    ]),
                child: Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height15,
                      left: Dimensions.height15,
                      right: Dimensions.height15),
                  child: AppColumn(text: popularProduct.name!),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // carosoul
        GetBuilder<PopularProductController>(builder: (popularProducts) {
          return popularProducts.isLoaded
              ? Container(
                  height: Dimensions.pageView,
                  child: PageView.builder(
                      controller: pageController,
                      itemCount: popularProducts.popularProductsList.length,
                      itemBuilder: (ctx, position) {
                        return _buildPageItems(position,
                            popularProducts.popularProductsList[position]);
                      }),
                )
              : const CircularProgressIndicator(
                  color: AppColors.mainColor,
                );
        }),
        // dots for the carasoul
        GetBuilder<PopularProductController>(
          builder: (popularProducts) => DotsIndicator(
            dotsCount: popularProducts.popularProductsList.isEmpty
                ? 1
                : popularProducts.popularProductsList.length,
            position: _currPageValue,
            decorator: DotsDecorator(
              activeColor: AppColors.mainColor,
              size: const Size.square(9.0),
              activeSize: const Size(18.0, 9.0),
              activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
            ),
          ),
        ),
        SizedBox(height: Dimensions.height20),
        Container(
          margin: EdgeInsets.only(left: Dimensions.width30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: "Recommended"),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: const EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: ".",
                    color: Colors.black26,
                  )),
              SizedBox(width: Dimensions.width10),
              Container(
                  margin: const EdgeInsets.only(bottom: 2),
                  child: SmallText(text: "Food Pairing"))
            ],
          ),
        ),
        SizedBox(height: Dimensions.height20),

        // List of popular items
        GetBuilder<RecommendedProductController>(
          builder: (recommendedProduct) {
            return recommendedProduct.isLoaded
                ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        recommendedProduct.recommendedProductsList.length,
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(RouteHelper.getRecommendedFood(index));
                        },
                        child: Container(
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              right: Dimensions.width20,
                              bottom: Dimensions.height10),
                          child: Row(
                            children: [
                              // image Section
                              Container(
                                height: Dimensions.listViewImgSize,
                                width: Dimensions.listViewImgSize,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white38,
                                  image: DecorationImage(
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        recommendedProduct
                                            .recommendedProductsList[index]
                                            .img!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              // text Section
                              Expanded(
                                child: Container(
                                    height: Dimensions.listViewTextContainer,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                              Dimensions.radius20),
                                          bottomRight: Radius.circular(
                                              Dimensions.radius20),
                                        ),
                                        color: Colors.white),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: Dimensions.width10,
                                          right: Dimensions.width10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          BigText(
                                              text: recommendedProduct
                                                  .recommendedProductsList[
                                                      index]
                                                  .name),
                                          SizedBox(height: Dimensions.height10),
                                          BigText(
                                              color: AppColors.textColor,
                                              size: 12,
                                              text: recommendedProduct
                                                  .recommendedProductsList[
                                                      index]
                                                  .description),
                                          SizedBox(height: Dimensions.height10),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              IconAndText(
                                                icon: Icons.circle_sharp,
                                                text: "Normal",
                                                iconColor: AppColors.iconColor1,
                                              ),
                                              IconAndText(
                                                icon: Icons.location_on,
                                                text: "1.2km",
                                                iconColor: AppColors.mainColor,
                                              ),
                                              IconAndText(
                                                icon: Icons.access_time_rounded,
                                                text: "32min",
                                                iconColor: AppColors.iconColor2,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                : const CircularProgressIndicator(
                    color: AppColors.mainColor,
                  );
          },
        ),
      ],
    );
  }
}
