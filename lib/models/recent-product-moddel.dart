import 'package:clickoncustomer/models/product-model.dart';

class RecentProductModel {
  int? id;
  int? productId;
  int? userId;
  String? createdAt;
  String? updatedAt;
  ProductModel? product;

  RecentProductModel(
      {this.id,
        this.productId,
        this.userId,
        this.createdAt,
        this.updatedAt,
        this.product});

  RecentProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['productId'];
    userId = json['userId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    product =
    json['product'] != null ?  ProductModel.fromJson(json['product']) : null;
  }

  static List<RecentProductModel> convertToList(List<dynamic> list) {
    return list.map((e) => RecentProductModel.fromJson(e)).toList();
  }
}