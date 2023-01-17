
import 'package:clickoncustomer/utils/global-key.dart';

import '../models/cart.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';
import '../utils/toast-message.dart';

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
        return Cart.convertToList(response["data"])[0];
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
      if(response['Success']){
        showSnackBar(
            message: 'Added to Cart', context: navigatorKey.currentState!.context);
      }
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


}