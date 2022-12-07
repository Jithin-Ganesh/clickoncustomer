class Categories {
  String? image;
  int? id;
  String? name;
  int? commission;
  String? description;
  String? createdAt;
  String? updatedAt;

  Categories(
      {this.image,
        this.id,
        this.name,
        this.commission,
        this.description,
        this.createdAt,
        this.updatedAt});

  Categories.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    id = json['id'];
    name = json['name'];
    commission = json['commission'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  static List<Categories> convertToList(List<dynamic> list) {
    if (list == null) return [];

    List<Categories> data = [];
    list.forEach((element) {
      data.add(Categories.fromJson(element));
    });
    return data;
  }
}


