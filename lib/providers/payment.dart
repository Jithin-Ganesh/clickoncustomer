import 'dart:developer';

import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../utils/global-key.dart';
import '../utils/razor-pay.dart';
import 'cart-provider.dart';

class PaymentProvider extends ChangeNotifier {
  bool isLoading = false;

  void startPaymentForWeb(
      {required BuildContext context,
      required String routeType,
      required List<int?> payOnline,
      required int? shipping,
      required int? billing,
      required int? id}) async {
    log('payment for web');
    // isLoading = true;
    // notifyListeners();
    RazorPayWeb razorPayWeb = RazorPayWeb();

    final response = await Provider.of<CartProvider>(context, listen: false)
        .checkOutOrder(
            routeType: routeType,
            payment: 1,
            id: id,
            shipping: shipping,
            payOnline: payOnline,
            billing: billing);

    Map<String, dynamic> options = {
      'key': response?.key,
      'amount': response?.amount,
      'order_id': response?.orderId,
    };

    final data = await razorPayWeb.checkout(options);

    print("$data");

    if (data['signature'] != null) {
      final result =
          await Provider.of<CartProvider>( context, listen: false).paymentResult(
              routeType: routeType,
              id: id,
              payment: PaymentSuccessResponse.fromMap({
                "razorpay_signature": data['signature'],
                "razorpay_order_id": data["razorpayOrderId"],
                "razorpay_payment_id": data["paymentId"],
              }));
      if (result?.id != null) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreenWeb.routeName, (route) => false);
      } else {
        Navigator.of(context)
            .pushNamedAndRemoveUntil(HomeScreenWeb.routeName, (route) => false);
      }
    } else {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(HomeScreenWeb.routeName, (route) => false);
    }
  }
}
