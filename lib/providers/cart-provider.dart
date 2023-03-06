import 'dart:developer';

import 'package:clickoncustomer/components/revieworderitem.dart';
import 'package:clickoncustomer/models/cart-products.dart';
import 'package:clickoncustomer/models/product-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../interfaces/cart-interface.dart';
import '../interfaces/order-interface.dart';
import '../interfaces/user-interface.dart';
import '../models/cart.dart';
import '../models/checkout-model.dart';
import '../models/payment-result.dart';
import '../models/review-order.dart';

class CartProvider extends ChangeNotifier {
  Cart? cart;
  int quantity = 1;
  CheckOutModel? onlineOrder;
  PaymentResult? paymentResultItem;
  ReviewOrder? reviewOrderItem;
  List<GetWishList> wishList = [];
  List<ProductModel> buy = [];
  List<GetWishList> saveList = [];
  GetWishList? wishListModel;
  ProductModel? productModel;







  List<CartProduct?> get codProductList {
    return cart != null ? cart!.cartProducts?.where((element) => element.paymentMode == PaymentMode.COD).toList() ?? [] : [];
  }

  List<CartProduct?> get onlineProductList {
    return cart != null ? cart!.cartProducts?.where((element) => element.paymentMode == PaymentMode.PAYONLINE).toList() ?? [] : [];
  }







  // add to wishlist
  Future<bool> addToWishList({required int? productId}) async {
    final status = await UserInterface.addToWishList(productId: productId);
    getWishlist();
    notifyListeners();
    return status;
  }

  // delete from wishlist
  Future<void> deleteWishList({required int? productId}) async {
    await UserInterface.deleteFromWishList(productId: productId);
    getWishlist();
    notifyListeners();
  }

  bool isWishListed(int? productId) {
    if (wishList.isNotEmpty) {
      final index = wishList
          .indexWhere((element) => element.productModel?.id == productId);
      log("true");
      return index > -1;
    } else {
      log("false");
      return false;
    }
  }

  Future<CheckOutModel> checkOutOnline({
    required int? shipping,
    required int? billing,
  }) async {
    final response = await OrderInterface.checkOutOnline(
        cartId: cart?.id,
        billing: billing,
        cartProducts: onlineProductList.map((e) => e?.id).toList(),
        shipping: shipping, );
    //cart = null;
    notifyListeners();
    return response;
  }

  Future<bool> checkOutCod({
    required int? shipping,
    required int? billing,
  }) async {
    final response = await OrderInterface.checkOutCod(
        cartId: cart?.id,
        billing: billing,
        cartProducts:  codProductList.map((e) => e?.id).toList(),
        shipping: shipping, );
    //cart = null;
    notifyListeners();
    return response;
  }

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

  Future<List<GetWishList>> getWishlist() async {
    wishList = await CartInterface.getWishList();
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



  Future<PaymentResult?> paymentResult({
    required PaymentSuccessResponse? payment,
  }) async {
    paymentResultItem = await CartInterface.paymentResult(
        payment: payment, id: cart?.id,);
    notifyListeners();
    return paymentResultItem;
  }

  Future<ReviewOrder?> reviewOrder(
      {required int? cartId, required int? shippingId}) async {
    reviewOrderItem = await CartInterface.reviewOrder(
        id: cartId,
        onlineProducts: onlineProductList.map((e) => e?.id).toList(),
        shippingId: shippingId,
        codProducts: codProductList.map((e) => e?.id).toList());
    notifyListeners();
    return reviewOrderItem;
  }

  CheckOutModel? getOnlineOrder() {
    return onlineOrder;
  }
}
