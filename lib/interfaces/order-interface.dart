import 'dart:developer';

import 'package:clickoncustomer/models/checkout-model.dart';
import 'package:clickoncustomer/models/order_review_model.dart';
import 'package:clickoncustomer/utils/global-key.dart';
import 'package:flutter/cupertino.dart';

import '../models/message.dart';
import '../models/order-history-model.dart';
import '../models/view_order_model.dart';
import '../utils/api/api_exception.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';
import '../utils/toast-message.dart';

class OrderInterface {
  //  placeOrder
  static Future<CheckOutModel> checkOutOnline(
      {required List<int?> cartProducts,
      required int? shipping,
      required int? billing,
      required int? cartId}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {
            "billingAddress": billing,
            "shippingAddress": shipping,
            'payment_mode': 2,
            "cart_products": cartProducts
          },
          route: "cart/$cartId/checkout",
          queries: {});
        return CheckOutModel.fromJson(response);
    } catch (err) {
      throw ApiException(err.toString());
    }
  }

  static Future<bool> checkOutCod(
      {required List<int?> cartProducts,
        required int? shipping,
        required int? billing,
        required int? cartId}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {
            "billingAddress": billing,
            "shippingAddress": shipping,
            'payment_mode': 1,
            "cart_products": cartProducts
          },
          route: "cart/$cartId/checkout",
          queries: {});
        return response['success'] ?? false;

    } catch (err) {
      throw ApiException(err.toString());
    }
  }

  // static Future<bool> payementDetails(
  //     {required int? businessId,required int paymentMode}) async {
  //   try {
  //     final response = await ApiRequest.send(
  //         method: ApiMethod.POST,
  //         body: {
  //           "email": "string",
  //           "is_international_shipping_allowed": true,
  //           "payment_modes": paymentMode
  //         },
  //         route: "cart/$cartId/checkout",
  //         queries: {});
  //     return response['success'] ?? false;
  //   } catch (err) {
  //     throw ApiException(err.toString());
  //   }
  // }


  static Future<bool> orderCancel({
    required int? orderId,
    required String? cancellationReason,
  }) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {"cancellationReason": cancellationReason},
          route: "order/$orderId/cancel",
          queries: {});

      return response== 1;
    } catch (err) {
      throw ApiException(err.toString());
    }
  }

  static Future<List<OrderReviewModel>> getOrderList(
      {required int? filterId,
      required int? page,
      required int? limit,
      required bool isFilter}) async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: isFilter
            ? 'order?status=$filterId&page=$page&limit=$limit'
            : "order",
        queries: {},
      );
      return OrderReviewModel.convertToList(response['order']);
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
