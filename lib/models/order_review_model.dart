class OrderReviewModel {
  int? id;
  String? referenceNumber;
  Null? cancellationReason;
  String? productName;
  String? thumbnail;
  int? price;
  int? status;
  int? quantity;
  String? productCode;
  int? paymentMode;
  int? tax;
  int? offer;
  int? netTotal;
  int? deliveryCharge;
  Null? expectedDeliveryDate;
  Null? trackingLink;
  Null? courierAgency;
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
      this.status,
      this.quantity,
      this.productCode,
      this.paymentMode,
      this.tax,
      this.offer,
      this.netTotal,
      this.deliveryCharge,
      this.expectedDeliveryDate,
      this.trackingLink,
      this.courierAgency,
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
    status = json['status'];
    quantity = json['quantity'];
    productCode = json['product_code'];
    paymentMode = json['paymentMode'];
    tax = json['tax'];
    offer = json['offer'];
    netTotal = json['netTotal'];
    deliveryCharge = json['deliveryCharge'];
    expectedDeliveryDate = json['expected_delivery_date'];
    trackingLink = json['tracking_link'];
    courierAgency = json['courier_agency'];
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
