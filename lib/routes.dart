import 'package:clickoncustomer/screens/web/cart/cart-screen.dart';
import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:clickoncustomer/screens/web/order-payment/order-payment-web.dart';
import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:clickoncustomer/screens/web/review-order/review-order-screen.dart';
import 'package:clickoncustomer/screens/web/your-account/your-account-web.dart';
import 'package:flutter/material.dart';

import 'components/otp-screen.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> get(BuildContext context) {
    return {
      ProductDetailScreenWeb.routeName: (context) => const ProductDetailScreenWeb(),
     CartScreenWeb.routeName: (context) => const CartScreenWeb(),
     HomeScreenWeb.routeName: (context) => const HomeScreenWeb(),
      ReviewOrderScreenWeb.routeName: (context) => const ReviewOrderScreenWeb(),
      PaymentOrderScreenWeb.routeName: (context) => const PaymentOrderScreenWeb(),
      YourAccountWeb.routeName: (context) => const YourAccountWeb(),
      OtpScreen.routeName: (context) => const OtpScreen(),
    };
  }
}
