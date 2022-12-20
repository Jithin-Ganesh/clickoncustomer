class ViewOrderModel {
  int? id;
  String? referenceNumber;
  Null? cancellationReason;
  String? productName;
  String? thumbnail;
  String? price;
  int? status;
  int? quantity;
  String? productCode;
  int? paymentMode;
  String? tax;
  int? offer;
  String? netTotal;
  int? deliveryCharge;
  Null? expectedDeliveryDate;
  Null? trackingLink;
  int? productId;
  Null? courierAgency;
  int? userId;
  int? businessId;
  Null? groupOrderId;
  String? createdAt;
  String? updatedAt;

  ViewOrderModel(
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
        this.productId,
        this.courierAgency,
        this.userId,
        this.businessId,
        this.groupOrderId,
        this.createdAt,
        this.updatedAt});

  ViewOrderModel.fromJson(Map<String, dynamic> json) {
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
    productId = json['productId'];
    courierAgency = json['courier_agency'];
    userId = json['userId'];
    businessId = json['businessId'];
    groupOrderId = json['groupOrderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  static List<ViewOrderModel> convertToList(List<dynamic> list) {
    if (list == null) return [];

    List<ViewOrderModel> data = [];
    list.forEach((element) {
      data.add(ViewOrderModel.fromJson(element));
    });

    return data;
  }
}