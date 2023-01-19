class CheckoutModel {
  String? orderId;
  String? key;
  int? amount;
  String? currency;

  CheckoutModel({
    this.orderId,
    this.key,
    this.amount,
    this.currency,
  });

  CheckoutModel.fromJson(Map<String, dynamic> json) {
    orderId = json['orderId'];
    key = json['key'];
    amount = json['amount'];
    currency = json['currency'];
  }

  static List<CheckoutModel> convertToList(List<dynamic> list) {
    if (list == null) return [];

    List<CheckoutModel> data = [];
    list.forEach((element) {
      data.add(CheckoutModel.fromJson(element));
    });
    return data;
  }
}
