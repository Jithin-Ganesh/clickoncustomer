import 'package:clickoncustomer/interfaces/auth-interface.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:clickoncustomer/screens/login_screen.dart';
import 'package:clickoncustomer/utils/global-key.dart';
import 'package:clickoncustomer/utils/toast-message.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/login.dart';
import '../utils/pref_utils.dart';

class AuthProvider with ChangeNotifier {

  Login? loginModel;
  bool isLoading = false;

  String? _token;

  enableLoading() {
    isLoading = true;
    notifyListeners();
  }

  disableLoading() {
    isLoading = false;
    notifyListeners();
  }


  init() {
    _token = PrefUtils().getToken();
    notifyListeners();
  }


  //Login
  Future<Login?> login({required String phone}) async {
     loginModel = await AuthInterface.login(phone: phone);
     //Provider.of<UserProvider>(navigatorKey.currentState!.context,listen: false).fetchUserProfile(id: loginModel?.userId);
     await PrefUtils().setUserId(loginModel?.userId ?? 0);
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


  logOut(BuildContext context) {
    PrefUtils().setToken(null);
    // PrefUtils().setBrandId(null);
    // PrefUtils().setVehicleId(null);
    Provider.of<UserProvider>(context, listen: false).clearUserOnLogout();
    Navigator.of(context)
        .pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false,arguments: const LoginScreen(isLoggedIn: false));
    print("TOKEN.......... ${PrefUtils().getToken()}");
  }

}
