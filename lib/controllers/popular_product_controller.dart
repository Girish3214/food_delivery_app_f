import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/popular_product_repo.dart';
import '../modals/cart_modal.dart';
import '../modals/product_modal.dart';
import '../utils/colors.dart';
import './cart_controller.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});

  List<dynamic> _popularProductsList = [];
  List<dynamic> get popularProductsList => _popularProductsList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;

  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductsList() async {
    Response response = await popularProductRepo.getPopularProductsList();
    if (response.statusCode == 200) {
      _popularProductsList = [];
      _popularProductsList.addAll(Product.fromJson(response.body).products);
      _isLoaded = true;
      update();
    } else {
      _isLoaded = true;
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
      // print("added: " + _quantity.toString());
    } else {
      _quantity = checkQuantity(_quantity - 1);
      // print("decremented: " + _quantity.toString());
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item count", "You can't reduce more",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);

      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item count", "You can't add more than 20 items",
          backgroundColor: AppColors.mainColor, colorText: Colors.white);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }

    // print("The quantity in cart: $_inCartItems");
  }

  void addItem(ProductModel product) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      // print("the key: ${value.id} The quamtity: ${value.quantity}");
    });
    update();
  }

  int get totalItems => _cart.totalItems;

  List<CartModal> get getItem => _cart.getItems;
}
