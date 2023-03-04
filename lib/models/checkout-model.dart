class CheckOutModel {
  int? totalAmount;
  String? orderId;
  String? key;
  int? amount;

  CheckOutModel({this.totalAmount, this.orderId, this.key, this.amount});

  CheckOutModel.fromJson(Map<String, dynamic> json) {
    totalAmount = json['totalAmount'];
    orderId = json['orderId'];
    key = json['key'];
    amount = json['amount'];
  }

  static List<CheckOutModel> convertToList(List<dynamic> list) {
    List<CheckOutModel> data = [];
    for (var element in list) {
      data.add(CheckOutModel.fromJson(element));
    }
    return data;
  }
}