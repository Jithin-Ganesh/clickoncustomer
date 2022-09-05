

import '../models/category.dart';

class CategoryInterface {

  static Future<List<Categories>?> fetchCategory() async {
    try {
      // final response = await ApiRequest.send(
      //   method: ApiMethod.GET,
      //   body: {},
      //   route: "category",
      //   queries: {},
      // );

      return Categories.convertToList(testCategories["category"]);
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
        "image":   "assets/images/dummy/image-cat-1.png",
      },
      {
        "id": 2,
        "name": "New Arrivals",
        "image":   "assets/images/dummy/image-cat-2.png",
      },
      {
        "id": 3,
        "name": "Electronics",
        "image":   "assets/images/dummy/image-cat-3.png",
      },
      {
        "id": 4,
        "name": "Fashion",
        "image":   "assets/images/dummy/image-cat-4.png",
      },
      {
        "id": 5,
        "name": "TV & Appliances",
        "image":   "assets/images/dummy/image-cat-1.png",
      },
      {
        "id": 6,
        "name": "Mobile",
        "image":   "assets/images/dummy/image-cat-2.png",
      },
      {
        "id": 7,
        "name": "Sports",
        "image":   "assets/images/dummy/image-cat-3.png",
      },
      {
        "id": 8,
        "name": "Kitchen & Dining",
        "image":   "assets/images/dummy/image-cat-4.png",
      },
      {
        "id": 9,
        "name": "Furniture",
        "image":   "assets/images/dummy/image-cat-1.png",
      },
    ]
  };


}
