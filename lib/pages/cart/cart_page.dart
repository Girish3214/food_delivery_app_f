import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../utils/app_constants.dart';
import '../../utils/colors.dart';
import '../../utils/dimensions.dart';
import '../../widgets/app_icon.dart';
import '../../widgets/big_text.dart';
import '../../widgets/small_text.dart';
import '../home/main_home_page.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: Dimensions.width20,
            right: Dimensions.width20,
            top: Dimensions.height30 * 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: AppIcon(
                    icon: Icons.arrow_back_ios,
                    iconColor: Colors.white,
                    bgColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                SizedBox(
                  width: Dimensions.width20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => MainHomePage());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    bgColor: AppColors.mainColor,
                    iconSize: Dimensions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart,
                  iconColor: Colors.white,
                  bgColor: AppColors.mainColor,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimensions.height20 * 5,
            left: Dimensions.width20,
            right: Dimensions.width20,
            bottom: 0,
            child: Container(
                margin: EdgeInsets.only(top: Dimensions.height15),
                child: GetBuilder<CartController>(builder: (cartConroller) {
                  return ListView.builder(
                      itemCount: cartConroller.getItems.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          height: Dimensions.height20 * 5,
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Container(
                                width: Dimensions.height20 * 5,
                                height: Dimensions.height20 * 5,
                                margin: EdgeInsets.only(
                                    bottom: Dimensions.height10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(AppConstants.BASE_URL +
                                        AppConstants.UPLOAD_URL +
                                        cartConroller.getItems[index].img!),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius20),
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: Dimensions.width10),
                              Expanded(
                                  child: Container(
                                height: Dimensions.height20 * 5,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    BigText(
                                        text:
                                            cartConroller.getItems[index].name!,
                                        color: Colors.black),
                                    SmallText(text: "Spicy"),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigText(
                                            text:
                                                "₹ ${cartConroller.getItems[index].price!}",
                                            color: AppColors.mainColor),
                                        Container(
                                          padding: EdgeInsets.only(
                                            top: Dimensions.height10,
                                            bottom: Dimensions.height10,
                                            left: Dimensions.width10,
                                            right: Dimensions.width10,
                                          ),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                Dimensions.radius15),
                                            color: Colors.white,
                                          ),
                                          child: Row(
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    // popularProduct.setQuantity(false);
                                                  },
                                                  child: const Icon(
                                                      Icons.remove,
                                                      color:
                                                          AppColors.signColor)),
                                              SizedBox(
                                                  width:
                                                      Dimensions.width10 / 2),
                                              BigText(
                                                  text:
                                                      "0"), // popularProduct.inCartItems.toString()
                                              SizedBox(
                                                  width:
                                                      Dimensions.width10 / 2),
                                              GestureDetector(
                                                  onTap: () {
                                                    // popularProduct.setQuantity(true);
                                                  },
                                                  child: const Icon(Icons.add,
                                                      color:
                                                          AppColors.signColor)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ))
                            ],
                          ),
                        );
                      });
                })),
          )
        ],
      ),
    );
  }
}
