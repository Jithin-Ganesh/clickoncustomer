import 'dart:developer';

import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/models/user.dart';
import 'package:date_format/date_format.dart' as DF;

class Order {
  int? id;
  String? itemTotal;
  String? discount;
  String? tax;
  String? netTotal;
  String? billingAddress;
  String? shippingAddress;
  late String _date;
  List<ProductModel>? orderProducts;
  User? customer;

  Order(
      {this.id,
        this.itemTotal,
        this.discount,
        this.tax,
        this.netTotal,
        this.orderProducts,});

  String get date {
    try {
      if (_date.isEmpty) throw Error();
      final date = DateTime.parse(_date).toLocal();

      final day = DF.formatDate(date, [DF.dd]);
      final month = DF.formatDate(date, [DF.mm]);

      final year = DF.formatDate(date, [DF.yyyy]);

      return "$day/$month/$year"; // 06/12/2021
    } catch (err) {
      return "";
    }
  }

  String get date2 {
    try {
      if (_date.isEmpty) throw Error();
      final date = DateTime.parse(_date).toLocal();

      final day = DF.formatDate(date, [DF.dd]);
      final month = DF.formatDate(date, [DF.M]);

      final year = DF.formatDate(date, [DF.yyyy]);
      final hour = DF.formatDate(date, [DF.hh]);
      final min = DF.formatDate(date, [DF.mm]);
      final amPm = DF.formatDate(date, [DF.am]);

      log("date = $day/$month/$year");
      return "$month $day, $year - $hour:$min $amPm"; // 06/DEC/2021
    } catch (err) {
      return "";
    }
  }

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['order']?['id'] ?? 0;
    itemTotal = json['itemTotal'] ?? '';
    discount = json['discount'] ?? '';
    tax = json['tax'] ?? '';
    _date = json['createdAt'] ?? '';
    netTotal = json['netTotal'] ?? '';
    billingAddress = json["billingAddress"] ?? "";
    shippingAddress = json["shipping_address"] ?? "";
    if (json['customer'] != null) {
      customer = User.fromJson(json['customer']);
    } else if (json["order"] != null && json["order"]["customer"] != null) {
      customer = User.fromJson(json["order"]["customer"]);
    }
    if (json['orderProducts'] != null) {
      orderProducts = ProductModel.convertToList(json['orderProducts']);
    }
  }

  static List<Order> convertToList(List<dynamic> list) {
    return list.map((e) => Order.fromJson(e)).toList();
  }
}
