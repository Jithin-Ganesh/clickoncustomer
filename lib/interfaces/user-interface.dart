
import '../models/address.dart';
import '../utils/api/api_exception.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';
import '../utils/toast-message.dart';

class UserInterface {
//  add address
  static Future<Map<String,dynamic>> addUserAddress({
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
            "phoneNumber": phoneNumber
          },
          route: isEdit ? "address/$addressId" : "address",
          queries: {});
      if(response["message"]!=null){
        showMessage(message: 'Address Saved',);
      }
      return response;

    } catch (err) {
      print("error");
      throw ApiException(err.toString());
    }
  }

  //2 . add user profile

  static Future<bool> addUserProfile(
      { String? firstName,
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

  static Future<List<Address>?> fetchAddressList() async{
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.GET,
          body: {},
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
        body: { },
        route: "address/$addressId",
        queries: {},
      );
    } catch (error) {
      print("fetching cart error: $error");
    }
  }

  // // 5 . fetch User Profile
  //
  // static Future<User?> fetchUserProfile() async{
  //   try {
  //     final response = await ApiRequest.send(
  //         method: ApiMethod.GET,
  //         body: {},
  //         route: "profile",
  //         queries: {});
  //     return User.fromJson(response["user"]);
  //   } catch (err) {
  //     print("fetching address error: $err");
  //     return null;
  //   }
  // }


}
