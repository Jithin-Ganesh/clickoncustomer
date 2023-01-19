


import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../models/cart.dart';
import '../models/checkout-model.dart';
import '../models/payment-result.dart';
import '../utils/api/api_exception.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class CartInterface {

  //fetch Cart
  static Future<Cart?> fetchCart() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "cart",
        queries: {},
      );
      if (response != null) {
        return Cart.convertToList(response)[0];
      } else {
        return null;
      }
    } catch (error) {
      print("fetching cart error: $error");
      return null;
    }
  }


  //add to cart items
  static Future<void> addCart(
      {required int? productId, required int? quantity}) async {
    try {
      final response =  ApiRequest.send(
        method: ApiMethod.POST,
        body: {"productId": productId, "quantity": quantity},
        route: "cart",
        queries: {},
      );
      // if(response['Success']){
      //
      //   showSnackBar(
      //       message: 'Added to Cart', context: navigatorKey.currentState!.context);
      // }
    } catch (error) {

      print("adding cart error: $error");
    }
  }


  //delete cart

  static Future<void> deleteCart({
    int? cartId,
  }) async {
    try {
      return await ApiRequest.send(
        method: ApiMethod.DELETE,
        body: {},
        route: "cart/$cartId",
        queries: {},
      );
    } catch (error) {
      print("fetching cart error: $error");
    }
  }

  //checkout
  static Future<CheckoutModel?> checkOutOrder(
      {required String routeType, required int? id, required Map<String, dynamic> body}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          route: "$routeType/$id/checkout",
          body: body,
          queries: {});

      return CheckoutModel.fromJson(response);
    } catch (err) {
      throw ApiException(err.toString());
    }
  }



  static Future<PaymentResult?> paymentResult({
    required PaymentSuccessResponse? payment,
    required int? id,
    required String routeType,
  }) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {
            "paymentId": payment?.paymentId,
            "razorPayOrderId": payment?.orderId,
            "signature": payment?.signature,
          },
          route: "$routeType/$id/payment-result",
          queries: {});
      if (response != null) {
        return PaymentResult.fromJson(response);
      } else {
        return null;
      }
    } catch (err) {
      return null;
      // throw ApiException(err.toString());
    }
  }

}