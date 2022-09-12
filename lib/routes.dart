import 'package:clickoncustomer/screens/web/product-details/product-detail-screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  Map<String, Widget Function(BuildContext)> get(BuildContext context) {
    return {
      ProductDetailScreenWeb.routeName: (context) => const ProductDetailScreenWeb(),
    };
  }
}
