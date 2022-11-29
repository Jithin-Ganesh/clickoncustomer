
import '../models/product-detail-model.dart';
import '../models/product-model.dart';
import '../utils/api/api_exception.dart';
import '../utils/api/api_methods.dart';
import '../utils/api/api_request.dart';

class ProductInterface {


// fetch product details

  static Future<ProductDetailModel?> fetchProductDetails(
      {required int productId,}) async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route: "product/$productId", queries: {},
      );


      return ProductDetailModel.fromJson(response);
    } catch (error) {
      print("fetching product details error: $error");
      throw ApiException(error.toString());
    }
  }

  // fetch products
  static Future<List<ProductModel>?> fetchProductList(
      { int? limit,int? familyId,
        String? query,
        int? page}) async {
    try {
      final response = await ApiRequest.send(
        method: ApiMethod.GET,
        body: {},
        route:
        'product?page=$page&limit=$limit&name=$query&familyId=$familyId',
        queries: {},
      );

      return ProductModel.convertToList(response);
    } catch (error) {
      print("fetching products error: $error");
      return [];
    }
  }

}
