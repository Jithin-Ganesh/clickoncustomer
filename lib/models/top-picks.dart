class TopPicks {
  String? image;
  int? id;
  String? name;
  int? commission;
  int? categoryId;
  String? description;
  String? createdAt;
  String? updatedAt;

  TopPicks({this.image,
    this.id,
    this.name,
    this.commission,
    this.categoryId,
    this.description,
    this.createdAt,
    this.updatedAt});

  TopPicks.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    name = json['name'];
    commission = json['commission'];
    categoryId = json['categoryId'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  static List<TopPicks> convertToList(List<dynamic> list) {
    List<TopPicks> data = [];
    for (var element in list) {
      data.add(TopPicks.fromJson(element));
    }
    return data;
  }
}