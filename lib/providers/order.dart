

import 'package:flutter/cupertino.dart';

import '../interfaces/order-interface.dart';
import '../models/message.dart';
import '../models/order.dart';

class OrderProvider extends ChangeNotifier {


  Future<Message?> placeOrder({
    required List<int?> cod,
    required List<int?> payOnline,
    required int? shipping,
    required int? billing,
    required int? cartId
  }) async {
    final response =
    await OrderInterface.placeOrder(payOnline: payOnline,cartId: cartId,billing: billing,cod: cod,shipping: shipping);
    notifyListeners();
    return response;
  }


}
