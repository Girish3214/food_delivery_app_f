import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/repository/cart_repo.dart';
import '../modals/cart_modal.dart';
import '../modals/product_modal.dart';
import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepo cartRepo;

  CartController({required this.cartRepo});
  Map<int, CartModal> _items = {};

  Map<int, CartModal> get items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModal(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          isExist: true,
          quantity: value.quantity! + quantity,
          time: DateTime.now().toString(),
        );
      });

      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(product.id!, () {
          return CartModal(
            id: product.id,
            name: product.name,
            price: product.price,
            img: product.img,
            isExist: true,
            quantity: quantity,
            time: DateTime.now().toString(),
          );
        });
      } else {
        Get.snackbar(
          "Cart count",
          "Please add more atleast 1 items",
          backgroundColor: AppColors.mainColor,
          colorText: Colors.white,
        );
      }
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if (key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
      totalQuantity += value.quantity!;
    });
    return totalQuantity;
  }
}