import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/utils/global-key.dart';

import '../models/address.dart';
import '../models/user.dart';
import '../utils/api/api_exception.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';
import '../utils/toast-message.dart';

class UserInterface {
//  add address
  static Future<Map<String, dynamic>> addUserAddress({
    String? state,
    String? country,
    String? city,
    String? pinCode,
    String? addressLine1,
    String? addressLine2,
    String? firstName,
    String? phoneNumber,
    String? lastName,
    required bool isEdit,
    int? addressId,
  }) async {
    try {
      final response = await ApiRequest.send(
          method: isEdit ? ApiMethod.PUT : ApiMethod.POST,
          body: {
            "firstName": firstName,
            "lastName": lastName,
            "addressLine1": addressLine1,
            "addressLine2": addressLine2,
            "city": city,
            "pincode": pinCode,
            "state": state,
            "country": country,
            "phoneNumber": phoneNumber,
          },
          route: isEdit ? "address/$addressId" : "address",
          queries: {});
      if (response["message"] != null) {

      }
      return response;
    } catch (err) {
      print("error");

      throw ApiException(err.toString());
    }
  }

  //2 . add user profile

  static Future<bool> addUserProfile({
    String? firstName,
    String? email,
    String? lastName,
  }) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {
            "firstName": firstName,
            "lastName": lastName,
            "email": email,
          },
          route: "profile",
          queries: {});
      return response['success'];
    } catch (err) {

      throw ApiException(err.toString());
    }
  }

  // get address list

  static Future<List<Address>?> fetchAddressList({required int? userId}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.GET,
          body: {"userId": userId},
          route: "address",
          queries: {});
      return Address.convertToList(response);
    } catch (err) {
      print("fetching address error: $err");

      return [];
    }
  }

//  delete Address

  static Future<void> deleteAddress({
    required int addressId,
  }) async {
    try {
      await ApiRequest.send(
        method: ApiMethod.DELETE,
        body: {},
        route: "address/$addressId",
        queries: {},
      );
    } catch (error) {

      print("fetching cart error: $error");
    }
  }

  // 5 . fetch User Profile

  static Future<User?> fetchUserProfile({required int? id}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.GET, body: {}, route: "user/$id", queries: {});
      return User.fromJson(response['data']);
    } catch (err) {
      print("fetching address error: $err");

      return null;
    }
  }

  //fetch wishlist
  static Future<List<ProductModel>?> fetchWishList() async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.GET, body: {}, route: "wishlist", queries: {});
      return ProductModel.convertToList(response["wishlist"]);
    } catch (err) {
      print("fetching wishlist error: $err");

      return [];
    }
  }

  // add to wishlist
  static Future<bool> addToWishList({required int? productId}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {"productId": productId ?? 0},
          route: "wishlist",
          queries: {});
      return response["wishlisted"];
    } catch (err) {
      print("adding wishlist error: $err");

      return false;
    }
  }

  //delete from wishlist
  static Future<bool> deleteFromWishList({required int? productId}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.DELETE,
          body: {},
          route: "wishlist/$productId",
          queries: {});
      return response["success"];
    } catch (err) {
      print("deleting wishlist error: $err");

      return false;
    }
  }
}
