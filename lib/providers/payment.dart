import 'dart:developer';

import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:clickoncustomer/utils/toast-message.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../utils/global-key.dart';
import '../utils/razor-pay.dart';
import 'cart-provider.dart';
import 'order.dart';

class PaymentProvider extends ChangeNotifier {
  bool isLoading = false;
  int? payment;

  setPayment(int value){
    payment = value;
    notifyListeners();
  }

  void startPaymentForWeb(
      {required BuildContext context,
        String? billingAddress, required int? shipping,
        required int? billing,}) async {
    log('payment for web');
    // isLoading = true;
    // notifyListeners();
    RazorPayWeb razorPayWeb = RazorPayWeb();

    final response = await Provider.of<CartProvider>(
        context,
        listen: false)
        .checkOutOnline(shipping: shipping,billing: billing,);

    Map<String, dynamic> options = {
      'key': response.key,
      'amount': response.amount,
      'order_id': response.orderId,
    };

    final data = await razorPayWeb.checkout(options);

    print("$data");

    if (data['signature'] != null) {
      final result = await Provider.of<CartProvider>(
          navigatorKey.currentContext!,
          listen: false)
          .paymentResult(
          payment: PaymentSuccessResponse.fromMap({
            "razorpay_signature": data['signature'],
            "razorpay_order_id": data["razorpayOrderId"],
            "razorpay_payment_id": data["paymentId"],
          }));
      if (result?.id != null) {
        showSnackBar(context: context,message: 'Order Placed');
        Navigator.of(navigatorKey.currentContext!).pushNamedAndRemoveUntil(HomeScreenWeb.routeName, (route) => false);
      } else {
        showSnackBar(context: context,message: 'Order Not Placed');
      }
    } else {
      showSnackBar(context: context,message: 'Order Not Placed');
    }
  }


  void startCODPaymentForWeb(
      {required int? shipping,
        required int? billing,
        required int? cartId,}) async {

    final response = await Provider.of<CartProvider>(
        navigatorKey.currentContext!,
        listen: false)
        .checkOutOnline(shipping: shipping,billing: billing,);
    //
    // if(response != null){
    //   payment = 1;
    //   Navigator.pushNamedAndRemoveUntil(context, PaymentSuccessMobile.routeName, (route) => false);
    // }else {
    //   Navigator.pushNamedAndRemoveUntil(context, PaymentFailed.routeName, (route) => false);
    // }

  }
}
