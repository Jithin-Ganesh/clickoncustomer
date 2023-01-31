import 'package:clickoncustomer/models/product-model.dart';

class BannerModel {
  int? id;
  int? type;
  int? clickType;
  int? businessId;
  int? subType;
  int? bannerAlign;
  String? searchTerm;
  String? image;
  int? parentId;
  String? createdAt;
  String? updatedAt;
  Business? business;

  BannerModel(
      {this.id,
        this.type,
        this.clickType,
        this.businessId,
        this.subType,
        this.bannerAlign,
        this.searchTerm,
        this.image,
        this.parentId,
        this.createdAt,
        this.updatedAt,
        this.business});

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    clickType = json['click_type'];
    businessId = json['businessId'];
    subType = json['subType'];
    image = json['image'];
    bannerAlign = json['bannerAlign'];
    searchTerm = json['search_term'];
    parentId = json['parentId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
  }
  static List<BannerModel> convertToList(List<dynamic> list) {
    List<BannerModel> data = [];
    for (var element in list) {
      data.add(BannerModel.fromJson(element));
    }
    return data;
  }
}

class Business {
  int? id;
  String? name;
  Location? location;
  double? distance;
  List<ProductFamilies>? productFamilies;

  Business(
      {this.id, this.name, this.location, this.distance, this.productFamilies});

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    distance = json['distance'];
    if (json['productFamilies'] != null) {
      productFamilies = <ProductFamilies>[];
      json['productFamilies'].forEach((v) {
        productFamilies!.add(new ProductFamilies.fromJson(v));
      });
    }
  }

  static List<Business> convertToList(List<dynamic> list) {
    List<Business> data = [];
    for (var element in list) {
      data.add(Business.fromJson(element));
    }
    return data;
  }

}

class Location {
  Crs? crs;
  String? type;
  List<double>? coordinates;

  Location({this.crs, this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    crs = json['crs'] != null ? new Crs.fromJson(json['crs']) : null;
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }
  static List<Location> convertToList(List<dynamic> list) {
    List<Location> data = [];
    for (var element in list) {
      data.add(Location.fromJson(element));
    }
    return data;
  }

}

class Crs {
  String? type;
  Properties? properties;

  Crs({this.type, this.properties});

  Crs.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }

  static List<Crs> convertToList(List<dynamic> list) {
    List<Crs> data = [];
    for (var element in list) {
      data.add(Crs.fromJson(element));
    }
    return data;
  }
}

class Properties {
  String? name;

  Properties({this.name});

  Properties.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
  static List<Properties> convertToList(List<dynamic> list) {
    List<Properties> data = [];
    for (var element in list) {
      data.add(Properties.fromJson(element));
    }
    return data;
  }

}

class ProductFamilies {
  String? image;
  int? id;
  String? name;
  String? description;
  int? sGST;
  int? cGST;
  String? nickName;
  int? businessId;
  int? subCategoryId;
  String? createdAt;
  String? updatedAt;
  List<ProductModel>? products;

  ProductFamilies(
      {this.image,
        this.id,
        this.name,
        this.description,
        this.sGST,
        this.cGST,
        this.nickName,
        this.businessId,
        this.subCategoryId,
        this.createdAt,
        this.updatedAt,
        this.products});

  ProductFamilies.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    name = json['name'];
    description = json['description'];
    sGST = json['SGST'];
    cGST = json['CGST'];
    nickName = json['nickName'];
    businessId = json['businessId'];
    subCategoryId = json['subCategoryId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    if (json['products'] != null) {
      products = <ProductModel>[];
      json['products'].forEach((v) {
        products!.add( ProductModel.fromJson(v));
      });
    }
  }
  static List<ProductFamilies> convertToList(List<dynamic> list) {
    List<ProductFamilies> data = [];
    for (var element in list) {
      data.add(ProductFamilies.fromJson(element));
    }
    return data;
  }

}


