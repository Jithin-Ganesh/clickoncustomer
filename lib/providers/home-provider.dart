import 'package:clickoncustomer/interfaces/home-interface.dart';
import 'package:clickoncustomer/models/product-model.dart';
import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier {
  List<ProductModel>? products = [];

  Future<List<ProductModel>?> fetchHome() async {
    products = await HomeInterface.fetchHome();
    notifyListeners();
    return products;
  }
}
