import 'package:clickoncustomer/models/product-model.dart';

import 'cart-products.dart';

class Cart {
  int? id;
  String? itemTotal;
  String? offer;
  int? tax;
  String? netTotal;
  String? deliveryCharges;
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
      this.deliveryCharges,
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
    deliveryCharges = json['deliveryCharges'];
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

class GetWishList {
  int? id;
  bool? wishlisted;
  int? userId;
  int? productId;
  String? createdAt;
  String? updatedAt;
  ProductModel? productModel;
  GetWishList(
      {this.id,
      this.userId,
      this.productId,
      this.wishlisted,
      this.createdAt,
      this.updatedAt,
      this.productModel});
  GetWishList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    productId = json['productId'];
    wishlisted = json['wishlisted'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productModel = ProductModel.fromJson(json['product']);
  }

  static List<GetWishList> convertToList(List<dynamic> list) {
    List<GetWishList> data = [];
    for (var element in list) {
      data.add(GetWishList.fromJson(element));
    }
    return data;
  }
}
