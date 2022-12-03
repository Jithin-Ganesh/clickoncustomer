class OrderReviewModel {
  int? id;
  String? referenceNumber;
  Null? cancellationReason;
  String? productName;
  String? thumbnail;
  int? price;
  int? productId;
  int? status;
  int? quantity;
  String? productCode;
  int? paymentMode;
  int? tax;
  int? offer;
  int? netTotal;
  int? deliveryCharge;
  int? userId;
  int? businessId;
  String? createdAt;
  String? updatedAt;

  OrderReviewModel(
      {this.id,
      this.referenceNumber,
      this.cancellationReason,
      this.productName,
      this.thumbnail,
      this.price,
      this.productId,
      this.status,
      this.quantity,
      this.productCode,
      this.paymentMode,
      this.tax,
      this.offer,
      this.netTotal,
      this.deliveryCharge,

      this.userId,
      this.businessId,
      this.createdAt,
      this.updatedAt});

  OrderReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referenceNumber = json['referenceNumber'];
    cancellationReason = json['cancellationReason'];
    productName = json['productName'];
    thumbnail = json['thumbnail'];
    price = json['price'];
    productId=json["productId"];
    status = json['status'];
    quantity = json['quantity'];
    productCode = json['product_code'];
    paymentMode = json['paymentMode'];
    tax = json['tax'];
    offer = json['offer'];
    netTotal = json['netTotal'];
    deliveryCharge = json['deliveryCharge'];

    userId = json['userId'];
    businessId = json['businessId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  static List<OrderReviewModel> convertToList(List<dynamic> list) {
    List<OrderReviewModel> data = [];
    for (var element in list) {
      data.add(OrderReviewModel.fromJson(element));
    }
    return data;
  }
}
