import 'package:flutter/cupertino.dart';

import '../interfaces/cart-interface.dart';
import '../models/cart.dart';

class CartProvider extends ChangeNotifier {
  Cart? cart;

  //Fetch Cart
  Future<Cart?> fetchCart() async {
    cart = await CartInterface.fetchCart();
    notifyListeners();
    return cart;
  }


  // Add To Cart
  Future<void> addCart({required int? productId, required int? qty}) async {
    await CartInterface.addCart(productId: productId, quantity: qty);
  }


}

