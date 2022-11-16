import 'package:flutter/cupertino.dart';

import '../interfaces/cart-interface.dart';

class CartProvider extends ChangeNotifier {


  Future<void> addCart({required int? productId, required int? qty}) async {
    await CartInterface.addCart(productId: productId, quantity: qty);
  }


}

