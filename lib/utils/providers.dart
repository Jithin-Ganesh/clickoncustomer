import 'package:clickoncustomer/providers/auth.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/providers/product-provider.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../providers/cart-provider.dart';
import '../providers/home-provider.dart';
import '../providers/order.dart';

class ProviderTree {
  List<SingleChildWidget> get(BuildContext context) {
    return [
      ChangeNotifierProvider.value(value: CategoryProvider()),
      ChangeNotifierProvider.value(value: AuthProvider()),
      ChangeNotifierProvider.value(value: HomeProvider()),
      ChangeNotifierProvider.value(value: ProductProvider()),
      ChangeNotifierProvider.value(value: CartProvider()),
      ChangeNotifierProvider.value(value: UserProvider()),
      ChangeNotifierProvider.value(value: OrderProvider()),
    ];
  }
}
