class ReviewOrder {
  List<Cod>? cod;
  List<Cod>? payOnline;

  ReviewOrder({this.cod, this.payOnline});

  ReviewOrder.fromJson(Map<String, dynamic> json) {
    if (json['cod'] != null) {
      cod = <Cod>[];
      json['cod'].forEach((v) {
        cod!.add(new Cod.fromJson(v));
      });
    }
    if (json['payOnline'] != null) {
      payOnline = <Cod>[];
      json['payOnline'].forEach((v) {
        payOnline!.add(new Cod.fromJson(v));
      });
    }
  }

  static List<ReviewOrder> convertToList(List<dynamic> list) {
    List<ReviewOrder> data = [];
    for (var element in list) {
      data.add(ReviewOrder.fromJson(element));
    }
    return data;
  }
}

class Cod {
  String? itemTotal;
  String? netTotal;
  String? shippingCharge;
  String? offer;

  Cod({this.itemTotal, this.netTotal, this.shippingCharge});

  Cod.fromJson(Map<String, dynamic> json) {
    itemTotal = json['itemTotal'];
    netTotal = json['netTotal'];
    shippingCharge = json['shippingCharge'];
    offer = json['offer'];
  }

  static List<Cod> convertToList(List<dynamic> list) {
    List<Cod> data = [];
    for (var element in list) {
      data.add(Cod.fromJson(element));
    }
    return data;
  }
}