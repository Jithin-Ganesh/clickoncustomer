import 'package:clickoncustomer/interfaces/auth-interface.dart';
import 'package:clickoncustomer/utils/global-key.dart';
import 'package:clickoncustomer/utils/toast-message.dart';
import 'package:flutter/cupertino.dart';

import '../models/login.dart';
import '../utils/pref_utils.dart';

class AuthProvider with ChangeNotifier {

  Login? loginModel;
  bool isLoading = false;

  enableLoading() {
    isLoading = true;
    notifyListeners();
  }

  disableLoading() {
    isLoading = false;
    notifyListeners();
  }

  //Login
  Future<Login?> login({required String phone}) async {
     loginModel = await AuthInterface.login(phone: phone);
    return loginModel;
  }

  // Sign Up
  Future<Login?> signUp({
    String? firstName,
    String? email,
    String? lastName,
    String? phone,
    String? password,
  }) async {
    final response = await AuthInterface.signUp(
      firstName: firstName,
      email: email,
      lastName: lastName,
      password: password,
      phone: phone
    );

    notifyListeners();
    return response;
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
