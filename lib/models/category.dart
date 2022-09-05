class Categories {
  int? id;
  String? name;
  late String image;

  Categories(
      {this.id,
        this.name,
        required this.image,});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'] ?? '';
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
