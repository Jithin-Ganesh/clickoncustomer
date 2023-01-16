import 'package:date_format/date_format.dart' as DF;
class Status {
  int? id;
  String? value;

  Status({this.id, this.value});

  Status.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['value'] = this.value;
    return data;
  }
}

class Customer {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  int? availableBalance;
  String? phone;
  String? password;
  bool? isActive;
  String? roles;
  String? createdAt;
  String? updatedAt;
  Null? cartId;

  Customer({this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.availableBalance,
    this.phone,
    this.password,
    this.isActive,
    this.roles,
    this.createdAt,
    this.updatedAt,
    this.cartId});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    availableBalance = json['available_balance'];
    phone = json['phone'];
    password = json['password'];
    isActive = json['isActive'];
    roles = json['roles'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    cartId = json['cartId'];
  }
}

class OrderReviewModel {
  Status? status;
  int? id;
  String? referenceNumber;
  String? cancellationReason;
  String? productName;
  String? thumbnail;
  String? price;
  int? quantity;
  String? productCode;
  int? paymentMode;
  String? tax;
  double? offer;
  String? billingAddress;
  String? shippingAddress;
  String? netTotal;
  String? deliveryCharge;
  String? expectedDeliveryDate;
  String? trackingLink;
  String? description;
  int? productId;
  String? courierAgency;
  int? userId;
  int? businessId;
  int? groupOrderId;
  String? createdAt;
  String? updatedAt;
  Customer? customer;

  OrderReviewModel(
      {this.status,
        this.id,
        this.referenceNumber,
        this.cancellationReason,
        this.productName,
        this.thumbnail,
        this.price,
        this.quantity,
        this.productCode,
        this.paymentMode,
        this.tax,
        this.offer,
        this.billingAddress,
        this.shippingAddress,
        this.netTotal,
        this.deliveryCharge,
        this.expectedDeliveryDate,
        this.trackingLink,
        this.description,
        this.productId,
        this.courierAgency,
        this.userId,
        this.businessId,
        this.groupOrderId,
        this.createdAt,
        this.updatedAt,
        this.customer});


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
    status =
   Status.fromJson(json['status']) ;
    id = json['id'];
    referenceNumber = json['referenceNumber'];
    cancellationReason = json['cancellationReason'];
    productName = json['productName'];
    thumbnail = json['thumbnail'];
    price = json['price'];
    quantity = json['quantity'];
    productCode = json['product_code'];
    paymentMode = json['paymentMode'];
    tax = json['tax'];
    offer = json['offer'];
    billingAddress = json['billing_address'];
    shippingAddress = json['shipping_address'];
    netTotal = json['netTotal'];
    deliveryCharge = json['deliveryCharge'];
    expectedDeliveryDate = json['expected_delivery_date'];
    trackingLink = json['tracking_link'];
    description = json['description'];
    productId = json['productId'];
    courierAgency = json['courier_agency'];
    userId = json['userId'];
    businessId = json['businessId'];
    groupOrderId = json['groupOrderId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
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

