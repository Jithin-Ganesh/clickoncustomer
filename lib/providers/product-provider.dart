import 'dart:developer';

import 'package:clickoncustomer/interfaces/product-interface.dart';
import 'package:clickoncustomer/models/product-model.dart';
import 'package:flutter/cupertino.dart';
import '../interfaces/product-provider.dart';
import '../models/product-detail-model.dart';

class ProductProvider with ChangeNotifier {
  ProductDetailModel? productDetails;
  List<ProductModel>? productList;

  Future<ProductDetailModel?> fetchProductDetails(
      {required int productId}) async {
    log('product id inside product $productId');
    productDetails =
        await ProductInterface.fetchProductDetails(productId: productId);

    notifyListeners();
    print("PRODUCTS:  $productDetails");
    return productDetails;
  }

  Future<List<ProductModel>?> fetchProductList(
      {int? limit, int? familyId, String? query, int? page}) async {
    productList = await ProductInterface.fetchProductList(
        page: page, limit: limit, familyId: familyId, query: query);
    notifyListeners();
    return productList;
  }

  Future<bool?> addProductReview(
      {required double rating,
      required String review,
      required int? productId}) async {
    final bool message = (await ReviewProductInterface.addProductReview(
        rating: rating, review: review, productId: productId));
    if (message) {
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
