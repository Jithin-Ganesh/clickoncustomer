import 'package:flutter/cupertino.dart';

import '../interfaces/cart-interface.dart';
import '../models/cart.dart';

class CartProvider extends ChangeNotifier {
  Cart? cart;
  int quantity = 1;


  void setQuantity({required int qty}){
    quantity = qty;
    notifyListeners();
  }

  //Fetch Cart
  Future<Cart?> fetchCart() async {
    cart = await CartInterface.fetchCart();
    notifyListeners();
    return cart;
  }


  // Add To Cart
  Future<void> addCart({required int? productId,}) async {
    await CartInterface.addCart(productId: productId, quantity: quantity);
  }


  // Delete Cart
  Future<void> deleteCart({
    int? cartId,
  }) async {
    await CartInterface.deleteCart( cartId: cartId);
  }



}

