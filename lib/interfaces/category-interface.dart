import 'package:clickoncustomer/models/top-picks.dart';

import '../models/category.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class SampleInterface {
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
      print("fetching  home categories error: $error");
      return [];
    }
  }

  static Future<List<TopPicks>?> fetchTopPicks() async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "home/top-picks",
        queries: {},
      );

      return TopPicks.convertToList(response);
    } catch (error) {
      print("fetching top picks error: $error");
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
      print("fetching categories error: $error");
      return [];
    }
  }

  static Future<List<Categories>?> fetchProducts() async {
    try {
      // final response = await ApiRequest.send(
      //   method: ApiMethod.GET,
      //   body: {},
      //   route: "category",
      //   queries: {},
      // );

      return Categories.convertToList(products["product"]);
    } catch (error) {
      print("fetching categories error: $error");
      return [];
    }
  }

  static Future<List<Categories>?> fetchJustLaunched() async {
    try {
      // final response = await ApiRequest.send(
      //   method: ApiMethod.GET,
      //   body: {},
      //   route: "category",
      //   queries: {},
      // );

      return Categories.convertToList(justLaunched["topPick"]);
    } catch (error) {
      print("fetching categories error: $error");
      return [];
    }
  }

  static Future<List<Categories>?> fetchRecently() async {
    try {
      // final response = await ApiRequest.send(
      //   method: ApiMethod.GET,
      //   body: {},
      //   route: "category",
      //   queries: {},
      // );

      return Categories.convertToList(recently["topPick"]);
    } catch (error) {
      print("fetching categories error: $error");
      return [];
    }
  }

  static Future<List<Categories>?> fetchProductImages() async {
    try {
      // final response = await ApiRequest.send(
      //   method: ApiMethod.GET,
      //   body: {},
      //   route: "category",
      //   queries: {},
      // );

      return Categories.convertToList(productDetails["topPick"]);
    } catch (error) {
      print("fetching categories error: $error");
      return [];
    }
  }

  static Map<String, dynamic> testCategories = {
    "success": true,
    "category": [
      {
        "id": 1,
        "name": "Top Offers",
        "image": "assets/images/dummy/image-cat-1.png",
      },
      {
        "id": 2,
        "name": "New Arrivals",
        "image": "assets/images/dummy/image-cat-2.png",
      },
      {
        "id": 3,
        "name": "Electronics",
        "image": "assets/images/dummy/image-cat-3.png",
      },
      {
        "id": 4,
        "name": "Fashion",
        "image": "assets/images/dummy/image-cat-4.png",
      },
      {
        "id": 5,
        "name": "TV & Appliances",
        "image": "assets/images/dummy/image-cat-1.png",
      },
      {
        "id": 6,
        "name": "Mobile",
        "image": "assets/images/dummy/image-cat-2.png",
      },
      {
        "id": 7,
        "name": "Sports",
        "image": "assets/images/dummy/image-cat-3.png",
      },
      {
        "id": 8,
        "name": "Kitchen & Dining",
        "image": "assets/images/dummy/image-cat-4.png",
      },
      {
        "id": 9,
        "name": "Furniture",
        "image": "assets/images/dummy/image-cat-1.png",
      },
    ]
  };

  static Map<String, dynamic> testTopPicks = {
    "success": true,
    "topPick": [
      {
        "id": 1,
        "name": "Watches",
        "image": "assets/images/dummy/image-watch.png",
      },
      {
        "id": 2,
        "name": "Footwear",
        "image": "assets/images/dummy/image-top-pick-2.png",
      },
      {
        "id": 3,
        "name": "Bags & Luggage",
        "image": "assets/images/dummy/image-top-pick-3.png",
      },
      {
        "id": 4,
        "name": "Clothing",
        "image": "assets/images/dummy/image-top-pick-4.png",
      },
      {
        "id": 5,
        "name": "Smartphones",
        "image": "assets/images/dummy/image-top-pick-5.png",
      },
      {
        "id": 6,
        "name": "Watches",
        "image": "assets/images/dummy/image-watch.png",
      },
      {
        "id": 7,
        "name": "Footwear",
        "image": "assets/images/dummy/image-top-pick-2.png",
      },
    ]
  };

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

  static Map<String, dynamic> products = {
    "success": true,
    "product": [
      {
        "id": 1,
        "name": "Watches",
        "image": "assets/images/dummy/product-1.png",
      },
      {
        "id": 2,
        "name": "Footwear",
        "image": "assets/images/dummy/product-2.png",
      },
      {
        "id": 3,
        "name": "Bags & Luggage",
        "image": "assets/images/dummy/product-3.png",
      },
      {
        "id": 4,
        "name": "Clothing",
        "image": "assets/images/dummy/product-4.png",
      },
      {
        "id": 5,
        "name": "Clothing",
        "image": "assets/images/dummy/product-5.png",
      },
      {
        "id": 6,
        "name": "Smartphones",
        "image": "assets/images/dummy/product-6.png",
      },
      {
        "id": 7,
        "name": "Smartphones",
        "image": "assets/images/dummy/product-4.png",
      },
    ]
  };

  static Map<String, dynamic> justLaunched = {
    "success": true,
    "topPick": [
      {
        "id": 1,
        "name": "Watches",
        "image": "assets/images/dummy/just-1.png",
      },
      {
        "id": 2,
        "name": "Footwear",
        "image": "assets/images/dummy/just-2.png",
      },
      {
        "id": 3,
        "name": "Bags & Luggage",
        "image": "assets/images/dummy/just-3.png",
      },
      {
        "id": 4,
        "name": "Clothing",
        "image": "assets/images/dummy/just-4.png",
      },
      {
        "id": 5,
        "name": "Smartphones",
        "image": "assets/images/dummy/just-5.png",
      },
    ]
  };

  static Map<String, dynamic> recently = {
    "success": true,
    "topPick": [
      {
        "id": 1,
        "name": "Watches",
        "image": "assets/images/dummy/recently-1.png",
      },
      {
        "id": 2,
        "name": "Footwear",
        "image": "assets/images/dummy/recently-2.png",
      },
      {
        "id": 3,
        "name": "Bags & Luggage",
        "image": "assets/images/dummy/recently-3.png",
      },
      {
        "id": 4,
        "name": "Clothing",
        "image": "assets/images/dummy/recently-4.png",
      },
      {
        "id": 5,
        "name": "Smartphones",
        "image": "assets/images/dummy/recently-5.png",
      },
      {
        "id": 6,
        "name": "Smartphones",
        "image": "assets/images/dummy/recently-6.png",
      },
      {
        "id": 7,
        "name": "Smartphones",
        "image": "assets/images/dummy/recently-7.png",
      },
    ]
  };

  static Map<String, dynamic> productDetails = {
    "success": true,
    "topPick": [
      {
        "id": 1,
        "name": "Watches",
        "image": "assets/images/dummy/image-baby-detail.png",
      },
      {
        "id": 2,
        "name": "Footwear",
        "image": "assets/images/dummy/image-baby-2.png",
      },
      {
        "id": 3,
        "name": "Bags & Luggage",
        "image": "assets/images/dummy/image-baby-3.png",
      },
      {
        "id": 4,
        "name": "Clothing",
        "image": "assets/images/dummy/image-baby-4.png",
      },
      {
        "id": 5,
        "name": "Smartphones",
        "image": "assets/images/dummy/image-baby-2.png",
      },
    ]
  };
}
