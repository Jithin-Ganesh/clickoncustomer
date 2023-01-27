class GroupOrderModel {
  int? id;
  int? minNoOfOrders;
  int? maxNoOfOrders;
  int? sellingPrice;
  int? offerType;
  String? startDate;
  String? endDate;
  int? businessId;
  String? createdAt;
  String? updatedAt;
  Business? business;

  GroupOrderModel(
      {this.id,
      this.minNoOfOrders,
      this.maxNoOfOrders,
      this.sellingPrice,
      this.offerType,
      this.startDate,
      this.endDate,
      this.businessId,
      this.createdAt,
      this.updatedAt,
      this.business});

  GroupOrderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    minNoOfOrders = json['min_no_of_orders'];
    maxNoOfOrders = json['max_no_of_orders'];
    sellingPrice = json['selling_price'];
    offerType = json['offer_type'];
    startDate = json['start_Date'];
    endDate = json['end_Date'];
    businessId = json['businessId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    business = json['business'] != null
        ? new Business.fromJson(json['business'])
        : null;
  }
  static List<GroupOrderModel> convertToList(List<dynamic> list) {
    return list.map((e) => GroupOrderModel.fromJson(e)).toList();
  }
}

class Business {
  int? id;
  String? name;
  Location? location;
  int? distance;

  Business({this.id, this.name, this.location, this.distance});

  Business.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    location = json['location'] != null
        ? new Location.fromJson(json['location'])
        : null;
    distance = json['distance'];
  }
  static List<Business> convertToList(List<dynamic> list) {
    return list.map((e) => Business.fromJson(e)).toList();
  }

}

class Location {
  Crs? crs;
  String? type;
  List<double>? coordinates;

  Location({this.crs, this.type, this.coordinates});

  Location.fromJson(Map<String, dynamic> json) {
    crs = json['crs'] != null ? new Crs.fromJson(json['crs']) : null;
    type = json['type'];
    coordinates = json['coordinates'].cast<double>();
  }

  static List<Location> convertToList(List<dynamic> list) {
    return list.map((e) => Location.fromJson(e)).toList();
  }
}

class Crs {
  String? type;
  Properties? properties;

  Crs({this.type, this.properties});

  Crs.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }
  static List<Crs> convertToList(List<dynamic> list) {
    return list.map((e) => Crs.fromJson(e)).toList();
  }

}

class Properties {
  String? name;

  Properties({this.name});

  Properties.fromJson(Map<String, dynamic> json) {
    name = json['name'];
  }
  static List<Properties> convertToList(List<dynamic> list) {
    return list.map((e) => Properties.fromJson(e)).toList();
  }

}
