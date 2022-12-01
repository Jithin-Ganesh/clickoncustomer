import 'package:clickoncustomer/models/order_review_model.dart';
import 'package:flutter/cupertino.dart';

import '../interfaces/order-interface.dart';
import '../models/message.dart';
import '../models/order.dart';

class OrderProvider extends ChangeNotifier {
  List<OrderReviewModel> orderList = [];
  OrderReviewModel? order;

  Future<bool> placeOrder({
    required List<int?> cod,
    required List<int?> payOnline,
    required int? shipping,
    required int? billing,
    required int? cartId,
  }) async {
    final response = await OrderInterface.placeOrder(
        payOnline: payOnline,
        cartId: cartId,
        billing: billing,
        cod: cod,
        shipping: shipping);
    notifyListeners();
    return response;
  }

  Future<List<OrderReviewModel>> getOrderList() async {
    orderList = (await OrderInterface.getOrderList());
    notifyListeners();
    return orderList;
  }

  Future<OrderReviewModel?> getOrderId({required int? orderId}) async {
    order = (await OrderInterface.getOrderId(orderId: orderId));
    notifyListeners();
    return order;
  }
}
