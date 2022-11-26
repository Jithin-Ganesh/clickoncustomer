import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../interfaces/product-provider.dart';
import '../models/product-detail-model.dart';

class ProductProvider with ChangeNotifier {

  ProductDetailModel? productDetails;


  Future<ProductDetailModel?> fetchProductDetails({required int productId}) async {
    log('product id inside product $productId');
    productDetails = await ProductInterface.fetchProductDetails(
        productId: productId);

    notifyListeners();
    print("PRODUCTS:  $productDetails");
    return productDetails;
  }
}
