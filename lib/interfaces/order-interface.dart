import 'dart:developer';

import 'package:clickoncustomer/models/order_review_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/message.dart';
import '../utils/api/api_exception.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class OrderInterface {
  //  placeOrder
  static Future<bool> placeOrder(
      {required List<int?> cod,
      required List<int?> payOnline,
      required int? shipping,
      required int? billing,
      required int? cartId}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {
            "billingAddress": billing,
            "shippingAddress": shipping,
            "pay_online_products": [0],
            "cod_products": cod
          },
          route: "cart/$cartId/checkout",
          queries: {});

      return response != null;
    } catch (err) {
      throw ApiException(err.toString());
    }
  }

  static Future<List<OrderReviewModel>> getOrderList() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "order",
        queries: {},
      );
      return OrderReviewModel.convertToList(response);
    } catch (error) {
      log("order error: $error");
      return [];
    }
  }

  static Future<OrderReviewModel> getOrderId({required int? orderId}) async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "order/$orderId",
        queries: {},
      );
      return OrderReviewModel.fromJson(response);
    } catch (error) {
      log("company error: $error");
      return OrderReviewModel();
    }
  }
}
