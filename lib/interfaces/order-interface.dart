import 'dart:developer';

import 'package:clickoncustomer/models/order_review_model.dart';
import 'package:flutter/cupertino.dart';

import '../models/message.dart';
import '../models/order-history-model.dart';
import '../models/view_order_model.dart';
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

      return response['Success']??false;
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
      log("get order id error: $error");
      return OrderReviewModel();
    }
  }
  static Future<OrderReviewModel?> getOrderById({required int? orderId}) async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "order/user/$orderId",
        queries: {},
      );
      return OrderReviewModel.fromJson(response);
    } catch (error) {
      log("get order by id error: $error");
      return null;
    }
  }
}
