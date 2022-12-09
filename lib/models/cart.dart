import 'cart-products.dart';

class Cart {
  int? id;
  int? itemTotal;
  int? offer;
  int? tax;
  int? netTotal;
  Null? deliveryCharges;
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
