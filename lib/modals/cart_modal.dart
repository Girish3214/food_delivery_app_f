import 'package:food_delivery_app/modals/product_modal.dart';

class CartModal {
  int? id;
  String? name;
  int? price;
  String? img;
  int? quantity;

  bool? isExist;
  String? time;

  ProductModel? product;

  CartModal({
    this.id,
    this.name,
    this.price,
    this.img,
    this.isExist,
    this.quantity,
    this.time,
    this.product,
  });

  CartModal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json["quantity"];
    isExist = json["isExist"];
    time = json["time"];
    product = ProductModel.fromJson(json["product"]);
  }
}
