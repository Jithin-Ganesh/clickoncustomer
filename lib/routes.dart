import 'package:clickoncustomer/screens/web/cart/cart-screen.dart';
import 'package:clickoncustomer/screens/web/home/home-screen-web.dart';
import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> get(BuildContext context) {
    return {
      ProductDetailScreenWeb.routeName: (context) => const ProductDetailScreenWeb(),
     CartScreenWeb.routeName: (context) => const CartScreenWeb(),
     HomeScreenWeb.routeName: (context) => const HomeScreenWeb(),
    };
  }
}
