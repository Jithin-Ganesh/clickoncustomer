import 'package:clickoncustomer/models/address.dart';
import 'package:clickoncustomer/models/order_review_model.dart';

import 'order.dart';

class OrderHistoryModel {
  OrderReviewModel? order;
  Address? billingAddress;
  Address? shippingAddress;

  OrderHistoryModel({this.order, this.billingAddress, this.shippingAddress});

  OrderHistoryModel.fromJson(Map<String, dynamic> json) {
    order = json['order'] != null ? OrderReviewModel.fromJson(json['order']) : null;
    billingAddress = json['billing_address'] != null
        ?  Address.fromJson(json['billing_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ?  Address.fromJson(json['shipping_address'])
        : null;
  }

  static List<OrderHistoryModel> convertToList(List<dynamic> list) {
    List<OrderHistoryModel> data = [];
    for (var element in list) {
      data.add(OrderHistoryModel.fromJson(element));
    }
    return data;
  }
}