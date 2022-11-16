
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class CartInterface {


  //add to cart items
  static Future<void> addCart(
      {required int? productId, required int? quantity}) async {
    try {
      await ApiRequest.send(
        method: ApiMethod.POST,
        body: {"productId": productId, "quantity": quantity},
        route: "cart",
        queries: {},
      );
    } catch (error) {
      print("adding cart error: $error");
    }
  }


}