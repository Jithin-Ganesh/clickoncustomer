

import 'package:clickoncustomer/models/product-model.dart';

class Cart {
  int? id;
  String? itemTotal;
  String? offer;
  String? tax;
  String? netTotal;
  String? createdAt;
  String? updatedAt;
  String? courierCharges;
  int? userId;
  List<ProductModel>? cartProducts;

  Cart(
      {this.id,
        this.itemTotal,
        this.offer,
        this.tax,
        this.netTotal,
        this.createdAt,
        this.updatedAt,
        this.userId,
        this.cartProducts});

  Cart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    itemTotal = json['itemTotal'].toString();
    offer = json['offer'].toString();
    tax = json['tax'].toString();
    netTotal = json['netTotal'].toString();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    userId = json['userId'];
    courierCharges = json['courierCharges'];
    if (json['cartProducts'] != null) {
      cartProducts = ProductModel.convertToList(json['cartProducts']);
    }
  }

  static List<Cart> convertToList(List<dynamic> list) {
    if (list == null) return [];

    List<Cart> data = [];
    list.forEach((element) {
      data.add(Cart.fromJson(element));
    });
    return data;
  }
}
