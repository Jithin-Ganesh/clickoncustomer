import 'dart:developer';

import 'package:clickoncustomer/models/product-model.dart';

import '../models/banner.dart';
import '../models/category.dart';
import '../models/top-picks.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class HomeInterface {
  static Future<List<ProductModel>?> fetchHome() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "home?latitude=9.591441&longitude=76.522171",
        queries: {},
      );

      return ProductModel.convertToList(response);
    } catch (error) {
      log("fetching home error: $error");
      return null;
    }
  }
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
}
