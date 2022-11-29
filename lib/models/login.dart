class Login {
  int? id;
  String? code;
  String? mode;
  int? userId;
  String? updatedAt;
  String? createdAt;

  Login(
      {this.id,
        this.code,
        this.mode,
        this.userId,
        this.updatedAt,
        this.createdAt});

  Login.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    mode = json['mode'];
    userId = json['userId'];
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
  }

  static List<Login> convertToList(List<dynamic> list) {
    List<Login> data = [];
    for (var element in list) {
      data.add(Login.fromJson(element));
    }
    return data;
  }

}