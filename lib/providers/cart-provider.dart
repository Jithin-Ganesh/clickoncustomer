import 'package:clickoncustomer/models/product-model.dart';
import 'package:flutter/cupertino.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../interfaces/cart-interface.dart';
import '../models/cart.dart';
import '../models/checkout-model.dart';
import '../models/payment-result.dart';

class CartProvider extends ChangeNotifier {
  Cart? cart;
  int quantity = 1;
  CheckoutModel? onlineOrder;
  PaymentResult? paymentResultItem;
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

  Future<CheckoutModel?> checkOutOrder(
      {required int payment,
        required String routeType,
        required List<int?> payOnline,
        required int? shipping,
        required int? billing,
        required int? id}) async {
    Map<String, dynamic> _map = {
      "billingAddress": billing,
      "wallet_debit": 0,
      "shippingAddress": shipping,
      "pay_online_products": payOnline ,
      "cod_products": [
        0
      ]
    };
    onlineOrder = await CartInterface.checkOutOrder(
      id: id,
      routeType: routeType, body: _map,
    );
    notifyListeners();
    // if (shippingAddress != null && billingAddress != null) {
    //   onlineOrder = await CartInterface.checkOutOrder(
    //     id: id,
    //     routeType: routeType, body: _map,
    //   );
    //   notifyListeners();
    // } else {
    //   showMessage(
    //     isSuccess: false,
    //     message: 'Please select all the fields.',
    //   );
    // }

    return onlineOrder;
  }


  Future<PaymentResult?> paymentResult({
    required PaymentSuccessResponse? payment,
    required int? id,
    required String routeType,
  }) async {
    paymentResultItem = await CartInterface.paymentResult(
        payment: payment, id: id, routeType: routeType);
    notifyListeners();
    return paymentResultItem;
  }


  CheckoutModel? getOnlineOrder() {
    return onlineOrder;
  }

}
