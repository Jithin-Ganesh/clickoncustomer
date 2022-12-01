
import 'package:flutter/cupertino.dart';
import '../interfaces/user-interface.dart';
import '../models/address.dart';
import '../models/product-model.dart';
import '../models/user.dart';

class UserProvider with ChangeNotifier {
  List<Address>? addressList;
  Address? selectedAddress;
  bool isPhoto = false;
  bool isLogo = false;
  String? billingAddress;
  User? user;
  List<ProductModel> wishList = [];

  selectAddress(Address? address) {
    selectedAddress = address;
    notifyListeners();
  }

  removeAddress() {
    selectedAddress = null;
    notifyListeners();
  }

  isAddressSelected(int? id){
    return selectedAddress?.id == id;
  }

  setBillingAddress({required String value}) {
    billingAddress = value;
    notifyListeners();
  }




  // add user address

  Future<Map<String, dynamic>> addUserAddress({
    String? state,
    String? country,
    String? city,
    String? pinCode,
    String? addressLine1,
    String? addressLine2,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    required bool isEdit,
    int? addressId,
  }) async {
    final message = await UserInterface.addUserAddress(
      firstName: firstName ?? "",
      lastName: lastName ?? '',
      addressLine1: addressLine1,
      addressLine2: addressLine2,
      city: city,
      country: country,
      pinCode: pinCode,
      state: state,
      isEdit: isEdit,
      addressId: addressId,phoneNumber: phoneNumber
    );
    notifyListeners();
    return message;
  }

  //  fetch user address
  Future<List<Address>> fetchAddressList() async {
    addressList = await UserInterface.fetchAddressList();
    notifyListeners();
    return addressList ?? [];
  }


  // add user

  Future<bool> addUserProfile({
    String? firstName,
    String? email,
    String? lastName,
  }) async {
    final response = await UserInterface.addUserProfile(
      firstName: firstName,
      email: email,
      lastName: lastName,
    );

    notifyListeners();
    return response;
  }

  // delete address

  Future<void> deleteAddress({required int addressId}) async {
    if (selectedAddress?.id == addressId) {
      selectedAddress = null;
    }
    await UserInterface.deleteAddress(addressId: addressId);
    notifyListeners();
  }

  // fetch user profile
  Future<User?> fetchUserProfile({required int? id}) async {
    user = await UserInterface.fetchUserProfile(id: id);
    notifyListeners();
    return user;
  }

  // add to wishlist
  Future<bool> addToWishList({required int? productId}) async {
    final status = await UserInterface.addToWishList(productId: productId);
    //fetchWishList();
    notifyListeners();
    return status;
  }

  // delete from wishlist
  Future<void> deleteWishList({required int? productId}) async {
    await UserInterface.deleteFromWishList(productId: productId);
    fetchWishList();
    notifyListeners();
  }



  // fetch wishlist
  Future<List<ProductModel>?> fetchWishList() async {
    wishList = (await UserInterface.fetchWishList())!;
    notifyListeners();
    return wishList;
  }

  // Check whether wishlisted
  bool isWishListed(int? productId) {
    if (wishList.isNotEmpty) {
      final index = wishList.indexWhere((element) => element.id == productId);
      return index > -1;
    } else {
      return false;
    }
  }



}
