import 'package:clickoncustomer/models/product-model.dart';

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

      return ProductModel.convertToList(response["data"]);
    } catch (error) {
      print("fetching home error: $error");
      return null;
    }
  }
}
