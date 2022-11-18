class ProductModel {
  int? id;
  String? name;
  String? price;
  String? amount;
  String? deliveryCharge;
  String? productCode;
  String? alternativeName;
  double? offer;
  String? image;
  String? thumbnail;
  String? description;
  String? createdAt;
  String? updatedAt;
  int? productFamilyId;
  int? businessId;
  int? quantity;
  int? subcategoryId;
  int? categoryId;
  int? cartId;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.amount,
    this.deliveryCharge,
    this.offer,
    this.image,
    this.thumbnail,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.productFamilyId,
    this.quantity,
    this.subcategoryId,
    this.businessId,
    this.categoryId,
    this.cartId,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    alternativeName = json['alternativeName'];
    name = json['name'];
    productCode = json['product_code'];
    price = json['price'].toString();
    amount = json['amount'].toString();
    deliveryCharge = json['deliveryCharge'].toString();
    if (json["offer"] is int) {
      offer = json['offer'].toDouble();
    }
    image = json['images'] ?? json['image'];
    thumbnail = json['thumbnail'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productFamilyId = json['productFamilyId'];
    businessId = json['businessId'];
    quantity = json['quantity'];
    subcategoryId = json['subCategoryId'];
    categoryId = json['categoryId'];
    cartId = json['cartId'];
  }

  static List<ProductModel> convertToList(List<dynamic> list) {
    List<ProductModel> data = [];
    for (var element in list) {
      data.add(ProductModel.fromJson(element));
    }
    return data;
  }
}
