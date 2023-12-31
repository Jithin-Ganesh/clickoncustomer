class ProductModel {
  String? images;
  String? thumbnail;
  int? id;
  String? name;
  int? price;
  double? offer;
  String? description;
  String? hSN;
  int? cGST;
  int? sGST;
  String? alternativeName;
  int? iGST;
  int? productFamilyId;
  int? categoryId;
  int? subCategoryId;
  int? quantity;
  String? productCode;
  int? ratings;
  int? groupOrderId;
  String? createdAt;
  String? updatedAt;
  String? sellingPrice;
  String? mrpPrice;

  ProductModel(
      {this.images,
        this.thumbnail,
        this.id,
        this.name,
        this.price,
        this.offer,
        this.description,
        this.hSN,
        this.cGST,
        this.sGST,
        this.alternativeName,
        this.iGST,
        this.productFamilyId,
        this.categoryId,
        this.subCategoryId,
        this.quantity,
        this.productCode,
        this.ratings,
        this.groupOrderId,
        this.createdAt,
        this.updatedAt,
        this.sellingPrice,
        this.mrpPrice});

  ProductModel.fromJson(Map<String, dynamic> json) {
    images = json['images'];
    thumbnail = json['thumbnail'];
    id = json['id'];
    name = json['name'];
    price = json['price'];
    offer = json['offer'];
    description = json['description'];
    hSN = json['HSN'];
    cGST = json['CGST'];
    sGST = json['SGST'];
    alternativeName = json['alternativeName'];
    iGST = json['IGST'];
    productFamilyId = json['productFamilyId'];
    categoryId = json['categoryId'];
    subCategoryId = json['subCategoryId'];
    quantity = json['quantity'];
    productCode = json['product_code'];
    ratings = json['ratings'];
    groupOrderId = json['groupOrderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    sellingPrice = json['selling_price'];
    mrpPrice = json['mrp_price'];
  }

  static List<ProductModel> convertToList(List<dynamic> list) {
    return list.map((e) => ProductModel.fromJson(e)).toList();
  }
}