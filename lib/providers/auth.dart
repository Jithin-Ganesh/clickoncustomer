import 'package:clickoncustomer/interfaces/auth-interface.dart';
import 'package:flutter/cupertino.dart';

import '../utils/pref_utils.dart';

class AuthProvider with ChangeNotifier {

  //Login
  Future<bool> login({required String phone}) async {
    final otp = await AuthInterface.login(phone: phone);

    return otp?.isNotEmpty ?? false;
  }

  //Verify OTP
  Future<bool> verifyOTP({required String? phone,required String? otp}) async {
    final token = await AuthInterface.verifyOTP(phone: phone,otp: otp);
    if(token != null){
      await PrefUtils().setToken(token);
      print("TOKEN.......... $token");
      notifyListeners();
    }
    return token?.isNotEmpty ?? false;
  }

}
