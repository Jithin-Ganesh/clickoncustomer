import 'package:date_format/date_format.dart' as DF;
class OrderReviewModel {
  String? price;
  int? status;
  String? tax;
  String? netTotal;
  String? deliveryCharge;
  int? id;
  String? referenceNumber;
  Null? cancellationReason;
  String? productName;
  String? thumbnail;
  int? quantity;
  String? productCode;
  int? paymentMode;
  int? offer;
  Null? expectedDeliveryDate;
  Null? trackingLink;
  Null? productId;
  Null? courierAgency;
  int? userId;
  int? businessId;
  Null? groupOrderId;
  String? createdAt;
  String? updatedAt;


  String get date {
    try {
      if (updatedAt!.isEmpty) throw Error();
      final date = DateTime.parse(updatedAt!).toLocal();

      final day = DF.formatDate(date, [DF.dd]);
      final month = DF.formatDate(date, [DF.M]);

      final year = DF.formatDate(date, [DF.yyyy]);
      final hour = DF.formatDate(date, [DF.hh]);
      final min = DF.formatDate(date, [DF.mm]);
      final amPm = DF.formatDate(date, [DF.am]);

      // log("date = $day/$month/$year");
      return "$month $day, $year - $hour:$min $amPm"; // 06/DEC/2021
    } catch (err) {
      return "";
    }
  }

  OrderReviewModel(
      {this.price,
        this.status,
        this.tax,
        this.netTotal,
        this.deliveryCharge,
        this.id,
        this.referenceNumber,
        this.cancellationReason,
        this.productName,
        this.thumbnail,
        this.quantity,
        this.productCode,
        this.paymentMode,
        this.offer,
        this.expectedDeliveryDate,
        this.trackingLink,
        this.productId,
        this.courierAgency,
        this.userId,
        this.businessId,
        this.groupOrderId,
        this.createdAt,
        this.updatedAt});

  OrderReviewModel.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    status = json['status'];
    tax = json['tax'];
    netTotal = json['netTotal'];
    deliveryCharge = json['deliveryCharge'];
    id = json['id'];
    referenceNumber = json['referenceNumber'];
    cancellationReason = json['cancellationReason'];
    productName = json['productName'];
    thumbnail = json['thumbnail'];
    quantity = json['quantity'];
    productCode = json['product_code'];
    paymentMode = json['paymentMode'];
    offer = json['offer'];
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

  static List<OrderReviewModel> convertToList(List<dynamic> list) {
    if (list == null) return [];

    List<OrderReviewModel> data = [];
    list.forEach((element) {
      data.add(OrderReviewModel.fromJson(element));
    });

    return data;
  }
}