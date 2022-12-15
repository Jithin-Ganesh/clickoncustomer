import 'package:date_format/date_format.dart' as DF;
class OrderReviewModel {
  int? id;
  String? referenceNumber;
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
  String? expectedDeliveryDate;
  String? trackingLink;
  String? courierAgency;
  int? userId;
  int? businessId;
  String? createdAt;
  String? updatedAt;

  OrderReviewModel(
      {this.id,
        this.referenceNumber,
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

  String get date {
    try {
      if (createdAt!.isEmpty) throw Error();
      final date = DateTime.parse(createdAt!).toLocal();

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

  String get expectedDate {
    try {
      if (expectedDeliveryDate!.isEmpty) throw Error();
      final date = DateTime.parse(expectedDeliveryDate!).toLocal();

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

  OrderReviewModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    referenceNumber = json['referenceNumber'];
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
    if (list == null) return [];

    List<OrderReviewModel> data = [];
    list.forEach((element) {
      data.add(OrderReviewModel.fromJson(element));
    });

    return data;
  }
}