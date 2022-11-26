
import 'package:clickoncustomer/models/user.dart';

import 'order.dart';

class Message {
  String? message;
  String? token;
  User? user;
  bool? success;
  Order? order;

  Message.fromJson(Map<String, dynamic> json)
  {
    if(json["message"] != null && json["message"] is String){
      message = json["message"];
    }
    if(json["message"] != null && json["message"] is Map<String, dynamic>){
      user = User.fromJson(json["message"]);
    }
    token = json["token"];
    success = json["success"];
    user = json['user'] != null ?  User.fromJson(json['user']) :null;
    if (json['order'] != null) {
      order = Order.fromJson(json['order']);
    }
  }

  static Message? parse(List<dynamic> list) {
    if (list == null) return null;

    return Message.fromJson(list[0]);
  }
}
