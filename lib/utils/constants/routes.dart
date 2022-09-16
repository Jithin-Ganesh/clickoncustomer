

import 'package:clickoncustomer/components/otp-screen.dart';
import 'package:flutter/cupertino.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> get(BuildContext context) {
    return {
      OtpScreen.routeName: (context) => const OtpScreen(),

    };
  }
}