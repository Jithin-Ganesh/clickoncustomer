


import '../models/login.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class AuthInterface {

  //Login API
  static Future<Login?> login(
      {required String phone}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          route: "auth/customer/authenticate",
          body: {
            "username": phone
          },
          queries: {});
      return Login.fromJson(response);
    } catch (err) {
      print("Authentication error: $err");
      return null;
    }
  }

  //OTP Verification
  static Future<String?> verifyOTP(
      {required String? phone,required String? otp}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          route: "auth/customer/verify",
          body: {
            "username": phone,
            'otp': otp
          },
          queries: {});
      return response['token'];
    } catch (err) {
      print("Verifying OTP error: $err");
      return '';
    }
  }

}
