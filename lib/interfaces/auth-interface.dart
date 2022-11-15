


import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class AuthInterface {

  //Login API
  static Future<String?> login(
      {required String phone}) async {
    try {
      final response = await ApiRequest.send(
          method: ApiMethod.POST,
          route: "auth/customer/authenticate",
          body: {
            "username": phone
          },
          queries: {});
      return '';
    } catch (err) {
      return '';
    }
  }

}
