class Address {
  int? id;
  String? firstName;
  String? lastName;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? pincode;
  String? state;
  String? country;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  Address(
      {this.id,
        this.firstName,
        this.lastName,
        this.addressLine1,
        this.addressLine2,
        this.city,
        this.pincode,
        this.state,
        this.country,
        this.phoneNumber,
        this.createdAt,
        this.updatedAt});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    addressLine1 = json['addressLine1'];
    addressLine2 = json['addressLine2'];
    city = json['city'];
    pincode = json['pincode'];
    state = json['state'];
    country = json['country'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }


  String? getFullAddress() {
    return '$firstName $lastName $addressLine1 $city $state $pincode';
  }

  String? getFullAddressPayment() {
    return '$firstName $lastName , $addressLine1 ,$city ,$state , $pincode';
  }


  static List<Address> convertToList(List<dynamic> list) {
    List<Address> data = [];
    for (var element in list) {
      data.add(Address.fromJson(element));
    }
    return data;
  }

}