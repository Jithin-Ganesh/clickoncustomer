
class CartProduct {
  int? id;
  String? name;
  int? productId;
  String? image;
  int? quantity;
  String? description;
  int? amount;
  double? offer;
  String? productCode;
  String? hSN;
  int? cGST;
  int? iGST;
  int? deliveryCharge;
  int? businessId;
  int? sGST;
  int? cartId;
  String? createdAt;
  String? updatedAt;

  CartProduct(
      {this.id,
        this.name,
        this.productId,
        this.image,
        this.quantity,
        this.description,
        this.amount,
        this.offer,
        this.productCode,
        this.hSN,
        this.cGST,
        this.iGST,
        this.deliveryCharge,
        this.businessId,
        this.sGST,
        this.cartId,
        this.createdAt,
        this.updatedAt});

  CartProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    productId = json['productId'];
    image = json['image'];
    quantity = json['quantity'];
    description = json['description'];
    amount = json['amount'];
    offer = json['offer'];
    productCode = json['product_code'];
    hSN = json['HSN'];
    cGST = json['CGST'];
    iGST = json['IGST'];
    deliveryCharge = json['deliveryCharge'];
    businessId = json['businessId'];
    sGST = json['SGST'];
    cartId = json['cartId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }


  static List<CartProduct> convertToList(List<dynamic> list) {
    List<CartProduct> data = [];
    for (var element in list) {
      data.add(CartProduct.fromJson(element));
    }
    return data;
  }

}

