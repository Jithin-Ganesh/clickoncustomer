import 'package:clickoncustomer/models/product-model.dart';
import 'package:flutter/cupertino.dart';

import '../interfaces/cart-interface.dart';
import '../models/cart.dart';

class CartProvider extends ChangeNotifier {
  Cart? cart;
  int quantity = 1;
  List<GetWishList> wishList = [];
  List<ProductModel> buy = [];
  List<GetWishList> saveList = [];
  GetWishList? wishListModel;
  ProductModel? productModel;

  void setQuantity({required int qty}) {
    quantity = qty;
    notifyListeners();
  }

  //Fetch Cart
  Future<Cart?> fetchCart() async {
    cart = await CartInterface.fetchCart();
    notifyListeners();
    return cart;
  }

  Future<List<GetWishList>> moveFromWishList() async {
    wishList = await CartInterface.moveFromWishList();
    notifyListeners();
    return wishList;
  }

  Future<List<ProductModel>> buyItAgain() async {
    buy = await CartInterface.buyItAgain();
    notifyListeners();
    return buy;
  }

  Future<List<GetWishList>> saveLater() async {
    saveList = await CartInterface.saveLater();
    notifyListeners();
    return saveList;
  }

  // Add To Cart
  Future<void> addCart({
    required int? productId,
  }) async {
    await CartInterface.addCart(productId: productId, quantity: quantity);
    fetchCart();
    notifyListeners();
  }

  // Delete Cart
  Future<void> deleteCart({
    int? cartId,
  }) async {
    await CartInterface.deleteCart(cartId: cartId);
    fetchCart();
    notifyListeners();
  }
}
