
import '../models/message.dart';
import '../utils/api/api_exception.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class OrderInterface {



  //  placeOrder
  static Future<Message?> placeOrder({
    required List<int?> cod,
    required List<int?> payOnline,
    required int? shipping,
    required int? billing,
    required int? cartId
  }) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {
            "billingAddress": billing,
            "shippingAddress": shipping,
            "pay_online_products": [0]
            ,
            "cod_products": cod
          },
          route: "cart/$cartId/checkout",
          queries: {});

      return Message.fromJson(response);
    } catch (err) {
      throw ApiException(err.toString());
    }
  }


}

