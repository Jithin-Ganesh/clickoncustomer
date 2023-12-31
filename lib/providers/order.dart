import 'package:clickoncustomer/models/order_review_model.dart';
import 'package:clickoncustomer/models/view_order_model.dart';
import 'package:flutter/cupertino.dart';

import '../interfaces/order-interface.dart';
import '../models/cart-products.dart';
import '../models/order-history-model.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderReviewModel> orderList = [];
  OrderReviewModel? order;
  List<int?> cartProducts = [];

  addCartProducts({required List<CartProduct>? products}) {
    products?.forEach((element) {
      cartProducts.add(element.id);
    });
    notifyListeners();
  }




  Future<bool> orderCancel({
    required String? cancellationReason,
    required int? orderId,
  }) async {
    final response = await OrderInterface.orderCancel(
        orderId: orderId, cancellationReason: cancellationReason);

    notifyListeners();
    return response;
  }

  Future<List<OrderReviewModel>> getOrderList(
      {required bool isConfirm,
      int? filterId,
      required int? page,
      required int? limit}) async {
    orderList = (await OrderInterface.getOrderList(
        filterId: filterId, page: page, limit: limit, isFilter: isConfirm));
    notifyListeners();
    return orderList;
  }

  Future<OrderReviewModel?> getOrderId({required int? orderId}) async {
    order = (await OrderInterface.getOrderId(orderId: orderId));
    notifyListeners();
    return order;
  }

  Future<OrderReviewModel?> getOrderById({required int? orderId}) async {
    order = (await OrderInterface.getOrderById(orderId: orderId));
    notifyListeners();
    return order;
  }
}
