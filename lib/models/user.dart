class User {
  int? id;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  String? password;
  bool? isActive;
  String? roles;
  String? createdAt;
  String? updatedAt;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.email,
        this.phone,
        this.password,
        this.isActive,
        this.roles,
        this.createdAt,
        this.updatedAt,});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    isActive = json['isActive'];
    roles = json['roles'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  static List<User> convertToList(List<dynamic> list) {
    List<User> data = [];
    for (var element in list) {
      data.add(User.fromJson(element));
    }
    return data;
  }

}