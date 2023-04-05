import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../widgets/big_text.dart';
import '../../widgets/expandable_text.dart';
import '../../widgets/app_icon.dart';

import '../../utils/colors.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const AppIcon(icon: Icons.clear)),
                const AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20)),
                  color: Colors.white,
                ),
                child: Center(
                    child:
                        BigText(text: "Food Salad", size: Dimensions.font26)),
              ),
            ),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/bestfood/food_6.jpeg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                  child: const ExpandableText(
                      text: "Bionicos are tasty fruit bowls drizzled with a sweet, creamy mixture of yogurt, condensed milk, and Mexican crema. Originally found on food carts in the streets of Guadalajara, Mexico, these bowls are commonly topped with shredded coconut, raisins, and granola.Bionicos are tasty fruit bowls drizzled with a sweet, creamy mixture of yogurt, condensed milk, and Mexican crema. Originally found on food carts in the streets of Guadalajara, Mexico, these bowls are commonly topped with shredded coconut, raisins, and granola." +
                          "Bionicos are tasty fruit bowls drizzled with a sweet, creamy mixture of yogurt, condensed milk, and Mexican crema. Originally found on food carts in the streets of Guadalajara, Mexico, these bowls are commonly topped with shredded coconut, raisins, and granola.Bionicos are tasty fruit bowls drizzled with a sweet, creamy mixture of yogurt, condensed milk, and Mexican crema. Originally found on food carts in the streets of Guadalajara, Mexico, these bowls are commonly topped with shredded coconut, raisins, and granola Bionicos are tasty fruit bowls drizzled with a sweet, creamy mixture of yogurt, condensed milk, and Mexican"),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
                BigText(
                  text: "₹120 " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  bgColor: AppColors.mainColor,
                  iconColor: Colors.white,
                  iconSize: Dimensions.iconSize24,
                ),
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height20,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.radius20 * 2),
                  topRight: Radius.circular(Dimensions.radius20 * 2)),
              color: AppColors.buttonBackgroundColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: const Icon(Icons.favorite, color: AppColors.mainColor),
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: AppColors.mainColor),
                  child: BigText(
                    text: "₹120 | Add to cart",
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
