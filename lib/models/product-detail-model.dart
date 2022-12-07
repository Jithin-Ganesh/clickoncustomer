

import 'package:clickoncustomer/models/product-model.dart';

class ProductDetailModel {
  ProductModel? family;
  String? message;

  int? selectedProductId;
  ProductModel? product;
  List<Attributes>? attributes;

  ProductDetailModel(
      {this.family,
        this.selectedProductId,
        this.product,
        this.attributes,
      });

  ProductDetailModel.fromJson(Map<String, dynamic> json) {

    family =
    json['family'] != null ? ProductModel.fromJson(json['family']) : null;
    selectedProductId = json['selectedProductId'];

    product =
    json['product'] != null ? ProductModel.fromJson(json['product']) : null;
    if (json['attributes'] != null&&json['attributes'] != []) {
      attributes = Attributes.convertToList(json['attributes'] );
    }
    message = json["message"];
  }

}


class Attributes {
  int? type;
  String? name;
  List<Values>? values;

  Attributes({this.type, this.name, this.values});

  Attributes.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    if (json['values'] != null) {
      values = Values.convertToList(json['values']);
    }
  }
  static List<Attributes> convertToList(List<dynamic> list) {
    if (list == null) return [];

    List<Attributes> data = [];
    list.forEach((element) {
      data.add(Attributes.fromJson(element));
    });
    return data;
  }

}

class Values {
  int? id;
  String? value;
  List<int>? products;

  Values({this.id, this.value, this.products});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
    products = json['products'].cast<int>();
  }

  static List<Values> convertToList(List<dynamic> list) {
    if (list == null) return [];

    List<Values> data = [];
    list.forEach((element) {
      data.add(Values.fromJson(element));
    });
    return data;
  }
}
