import '../models/login.dart';
import '../utils/api/api_exception.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';
import '../utils/global-key.dart';
import '../utils/toast-message.dart';

class AuthInterface {
  //Login API
  static Future<Login?> login({required String phone}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          route: "auth/customer/authenticate",
          body: {"username": phone},
          queries: {});
      if(response['code'] != null){
        return Login.fromJson(response);
      }else{
        print("Authentication error: ${response['message']}");
        showSnackBar(message: response['message'], context: navigatorKey.currentContext!,isSuccess: false);
      }

    } catch (err) {
      print("Authentication error: $err");
      return null;
    }
  }

  static Future<Login?> signUp({
    String? firstName,
    String? email,
    String? lastName,
    String? phone,
    String? password,
  }) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          body: {
            "firstName": firstName,
            "lastName": lastName,
            "password": password,
            "email": email,
            "phone": phone,
            "roles": [3]
          },
          route: "auth/customer/register",
          queries: {});
      return Login.fromJson(response);
    } catch (err) {
      throw ApiException(err.toString());
    }
  }

  //OTP Verification
  static Future<String?> verifyOTP(
      {required String? phone, required String? otp}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          route: "auth/customer/verify",
          body: {"username": phone, 'otp': otp},
          queries: {});
      return response['token'];
    } catch (err) {
      print("Verifying OTP error: $err");
      return null;
    }
  }
}
