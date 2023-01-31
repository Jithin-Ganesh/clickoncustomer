import 'dart:developer';

import 'package:clickoncustomer/models/top-picks.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/product-model.dart';
import '../models/recent-product-moddel.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class CategoryInterface {
  static Future<List<Categories>?> fetchCategory() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "home/home-categorie",
        queries: {},
      );

      return Categories.convertToList(response);
    } catch (error) {
      log("fetching  home categories error: $error");
      return [];
    }
  }

  static Future<List<ProductModel>?> fetchLatestProduct() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "home/latest-product",
        queries: {},
      );

      return ProductModel.convertToList(response);
    } catch (error) {
      log("fetching home error: $error");
      return null;
    }
  }

  static Future<List<BannerModel>?> fetchHomeBanners() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "home/home-banner?latitude=9.56&longitude=76.56&radius=50",
        queries: {},
      );

      return BannerModel.convertToList(response);
    } catch (error) {
      log("fetching  home banners error: $error");
      return [];
    }
  }

  static Future<List<TopPickModel>?> fetchTopPicks() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "home/top-picks",
        queries: {},
      );

      return TopPickModel.convertToList(response);
    } catch (error) {
      log("fetching top picks error: $error");
      return [];
    }
  }

  static Future<List<Categories>?> fetchGroupOrders() async {
    try {
      // final response = await ApiRequest.send(
      //   method: ApiMethod.GET,
      //   body: {},
      //   route: "category",
      //   queries: {},
      // );

      return Categories.convertToList(groupOrders["groupOrder"]);
    } catch (error) {
      log("fetching categories error: $error");
      return [];
    }
  }

  static Future<List<ProductModel>?> fetchProductsForYou() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "home/products-for-you",
        queries: {},
      );

      return ProductModel.convertToList(response);
    } catch (error) {
      log("fetching products for u error: $error");
      return [];
    }
  }

  static Future<List<RecentProductModel>?> fetchRecentProducts() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "home/recently-viewed-product",
        queries: {},
      );

      return RecentProductModel.convertToList(response);
    } catch (error) {
      log("fetching products for u error: $error");
      return [];
    }
  }

  static Map<String, dynamic> groupOrders = {
    "success": true,
    "groupOrder": [
      {
        "id": 1,
        "name": "Watches",
        "image": "assets/images/dummy/group-order-1.png",
      },
      {
        "id": 2,
        "name": "Footwear",
        "image": "assets/images/dummy/group-order-2.png",
      },
      {
        "id": 3,
        "name": "Bags & Luggage",
        "image": "assets/images/dummy/group-order-3.png",
      },
      {
        "id": 4,
        "name": "Clothing",
        "image": "assets/images/dummy/group-order-4.png",
      },
      {
        "id": 5,
        "name": "Clothing",
        "image": "assets/images/dummy/image-xbox-1.png",
      },
      {
        "id": 6,
        "name": "Smartphones",
        "image": "assets/images/dummy/group-order-5.png",
      },
    ]
  };
}
