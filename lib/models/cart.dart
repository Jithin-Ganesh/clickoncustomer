

import 'package:clickoncustomer/models/cart-products.dart';

class Cart {
  int? id;
  int? itemTotal;
  double? offer;
  int? tax;
  int? netTotal;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<CartProduct>? cartProducts;

  Cart(
      {this.id,
        this.itemTotal,
        this.offer,
        this.tax,
        this.netTotal,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.cartProducts});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemTotal = json['itemTotal'];
    offer = json['offer'];
    tax = json['tax'];
    netTotal = json['netTotal'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['cartProducts'] != null) {
      cartProducts = CartProduct.convertToList(json['cartProducts']);
    }
  }

  static List<Cart> convertToList(List<dynamic> list) {
    List<Cart> data = [];
    for (var element in list) {
      data.add(Cart.fromJson(element));
    }
    return data;
  }


}
