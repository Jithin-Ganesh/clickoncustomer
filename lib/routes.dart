import 'package:clickoncustomer/models/login.dart';
import 'package:clickoncustomer/screens/login_screen.dart';
import 'package:clickoncustomer/screens/web/account-order/account-order-screen.dart';
import 'package:clickoncustomer/screens/web/cart/cart-screen.dart';
import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:clickoncustomer/screens/web/order-details/order-details-item-web.dart';
import 'package:clickoncustomer/screens/web/order-details/order-details-screen.dart';
import 'package:clickoncustomer/screens/web/order-feedback/order-delivery-feedback.dart';
import 'package:clickoncustomer/screens/web/order-feedback/order-product-review.dart';
import 'package:clickoncustomer/screens/web/order-feedback/order-seller-feedback-screen-web.dart';
import 'package:clickoncustomer/screens/web/order-payment/order-payment-web.dart';
import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:clickoncustomer/screens/web/profile/profile-screen.dart';
import 'package:clickoncustomer/screens/web/review-order/review-order-screen.dart';
import 'package:clickoncustomer/screens/web/your-account/your-account-web.dart';
import 'package:flutter/material.dart';

import 'components/rate-your-experience-screen1.dart';
import 'components/sign-up.dart';
import 'screens/otp-screen.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> get(BuildContext context) {
    return {
      ProductDetailScreenWeb.routeName: (context) => const ProductDetailScreenWeb(),
     CartScreenWeb.routeName: (context) => const CartScreenWeb(),
     HomeScreenWeb.routeName: (context) => const HomeScreenWeb(),
      ReviewOrderScreenWeb.routeName: (context) => const ReviewOrderScreenWeb(),
      PaymentOrderScreenWeb.routeName: (context) => const PaymentOrderScreenWeb(),
      YourAccountWeb.routeName: (context) => const YourAccountWeb(),
      AccountOrderScreenWeb.routeName: (context) => const AccountOrderScreenWeb(),
      OrderDetailsScreenWeb.routeName: (context) => const OrderDetailsScreenWeb(),
      OrderSellerFeedBackScreenWeb.routeName: (context) => const OrderSellerFeedBackScreenWeb(),
      OrderDeliveryFeedBackScreenWeb.routeName: (context) => const OrderDeliveryFeedBackScreenWeb(),
      OrderProductReviewScreenWeb.routeName: (context) => const OrderProductReviewScreenWeb(),
      OtpScreen.routeName: (context) => const OtpScreen(isLoggedIn: false,),
      ProfileWebScreen.routeName: (context) => const ProfileWebScreen(),
      RateYourExperienceScreen.routeName:(context)=>const RateYourExperienceScreen(),
      SignUp.routeName:(context)=>const SignUp(),
      LoginScreen.routeName:(context)=> const LoginScreen(isLoggedIn: false,),

    };
  }
}
