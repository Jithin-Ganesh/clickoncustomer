import 'package:clickoncustomer/interfaces/category-interface.dart';
import 'package:flutter/cupertino.dart';

import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Categories>? categoriesList;
  List<Categories>? topPicks;
  List<Categories>? groupOrders;
  List<Categories>? products;
  List<Categories>? justLaunched;
  List<Categories>? recentlyAdded;
  Future<List<Categories>?> fetchCategory() async {
    categoriesList = await SampleInterface.fetchCategory();
    notifyListeners();
    return categoriesList ?? [];
  }

  Future<List<Categories>?> fetchTopPicks() async {
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


  Future<List<Categories>?> fetchHome()async{
    await fetchJustLaunched();
    await fetchProducts();
    await fetchGroupOrders();
    await fetchTopPicks();
    await fetchCategory();
    await fetchRecentlyAdded();
    return categoriesList ?? [];
  }


}
