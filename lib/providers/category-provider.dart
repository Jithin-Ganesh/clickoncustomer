import 'package:clickoncustomer/interfaces/category-interface.dart';
import 'package:clickoncustomer/models/top-picks.dart';
import 'package:flutter/cupertino.dart';

import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Categories>? categoriesList;
  List<TopPicks>? topPicks;
  List<Categories>? groupOrders;
  List<Categories>? products;
  List<Categories>? justLaunched;
  List<Categories>? recentlyAdded;
  List<Categories>? productDetails;

  Future<List<Categories>?> fetchProductImages() async {
    productDetails = await SampleInterface.fetchProductImages();
    notifyListeners();
    return productDetails ?? [];
  }


  Future<List<Categories>?> fetchCategory() async {
    categoriesList = await SampleInterface.fetchCategory();
    return categoriesList ?? [];
  }

  Future<List<TopPicks>?> fetchTopPicks() async {
    topPicks = await SampleInterface.fetchTopPicks();
    notifyListeners();
    return topPicks ?? [];
  }

  Future<List<Categories>?> fetchGroupOrders() async {
    groupOrders = await SampleInterface.fetchGroupOrders();
    notifyListeners();
    return groupOrders ?? [];
  }

  Future<List<Categories>?> fetchProducts() async {
    products = await SampleInterface.fetchProducts();
    notifyListeners();
    return products ?? [];
  }

  Future<List<Categories>?> fetchJustLaunched() async {
    justLaunched = await SampleInterface.fetchJustLaunched();
    notifyListeners();
    return justLaunched ?? [];
  }

  Future<List<Categories>?> fetchRecentlyAdded() async {
    recentlyAdded = await SampleInterface.fetchRecently();
    notifyListeners();
    return recentlyAdded ?? [];
  }



}
