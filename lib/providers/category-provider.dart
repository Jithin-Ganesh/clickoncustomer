import 'package:clickoncustomer/interfaces/category-interface.dart';
import 'package:clickoncustomer/models/banner.dart';
import 'package:clickoncustomer/models/recent-product-moddel.dart';
import 'package:clickoncustomer/models/top-picks.dart';
import 'package:flutter/cupertino.dart';

import '../models/category.dart';
import '../models/product-model.dart';

class CategoryProvider extends ChangeNotifier {
  List<Categories>? categoriesList;
  List<TopPickModel>? topPicks;
  List<Categories>? groupOrders;
  List<ProductModel>? productsForYou;
  List<RecentProductModel>? recentProducts;
  List<Categories>? justLaunched;
  List<Categories>? recentlyAdded;
  List<Categories>? productDetails;
  List<ProductModel>? latestProducts = [];
  List<BannerModel>? homeBanners = [];

  Future<List<ProductModel>?> fetchLatestProducts() async {
    latestProducts = await CategoryInterface.fetchLatestProduct();
    notifyListeners();
    return latestProducts;
  }

  Future<List<BannerModel>?> fetchHomeBanners() async {
    homeBanners = await CategoryInterface.fetchHomeBanners();
    notifyListeners();
    return homeBanners;
  }


  Future<List<Categories>?> fetchCategory() async {
    categoriesList = await CategoryInterface.fetchCategory();
    return categoriesList ?? [];
  }

  Future<List<TopPickModel>?> fetchTopPicks() async {
    topPicks = await CategoryInterface.fetchTopPicks();
    return topPicks;
  }


  Future<List<Categories>?> fetchGroupOrders() async {
    groupOrders = await CategoryInterface.fetchGroupOrders();
    notifyListeners();
    return groupOrders ?? [];
  }

  Future<List<ProductModel>?> fetchProductsForYou() async {
    productsForYou = await CategoryInterface.fetchProductsForYou();
    notifyListeners();
    return productsForYou ?? [];
  }

  Future<List<RecentProductModel>?> fetchRecentProducts() async {
    recentProducts = await CategoryInterface.fetchRecentProducts();
    notifyListeners();
    return recentProducts;
  }





}
