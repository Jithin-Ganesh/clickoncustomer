import 'package:clickoncustomer/providers/auth.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/providers/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class ProviderTree {
  List<SingleChildWidget> get(BuildContext context) {
    return [
      ChangeNotifierProvider.value(value: HomeProvider()),
      ChangeNotifierProvider.value(value: CategoryProvider()),
      ChangeNotifierProvider.value(value: AuthProvider()),
    ];
  }
}
