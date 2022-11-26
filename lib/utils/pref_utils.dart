/*
  For storing data in the shared preference
  What is shared prefrence?
  A small datastorage (key-value) pair in android and Ios
  Why is it used?
  Mainly for storing user login token.
 */

import 'dart:convert';

import 'package:hive/hive.dart';

class PrefUtils {
  static final String APP_NAME = "SpareParts";
  static final String TOKEN = "TOKEN";
  static final String BRAND_ID = "BRAND_ID";
  static final String VEHICLE_ID = "VEHICLE_ID";
  static final String BRAND_NAME = "BRAND_NAME";
  static final String VEHICLE_NAME = "VEHICLE_NAME";
  static final String FIREBASE_TOKEN = "FIREBASE_TOKEN";
  static final String USER_TYPE = "USER_TYPE";
  static final String BUSINESS_TYPE = "TYPE";

  static final String USER_NAME = "USER_NAME";

  Box getBox() {
    return Hive.box(APP_NAME);
  }

  setToken(String? token) async {
    getBox().put(TOKEN, token);
  }

  setBrandId(String? brandId) async {
    getBox().put(BRAND_ID, brandId);
  }

  setBrandName(String? brandName) async {
    getBox().put(BRAND_NAME, brandName);
  }

  setVehicleName(String? vehicleName) async {
    getBox().put(VEHICLE_NAME, vehicleName);
  }

  setBusinessType(int? type) async {
    getBox().put(BUSINESS_TYPE, type);
  }

  getBusinessType() {
    final type = getBox().get(BUSINESS_TYPE);
    return type;
  }



  setUserType(int? type) async {
    getBox().put(USER_TYPE, type);
  }



  getUserType() {
    final userType = getBox().get(USER_TYPE);
    return userType;
  }
  setUserName(String? name) async {
    getBox().put(USER_NAME, name);
  }

  getUserName() {
    final userType = getBox().get(USER_TYPE);
    return userType;
  }

  setVehicleId(String? vehicleId) async {
    getBox().put(VEHICLE_ID, vehicleId);
  }

  getBrandId() {
    final brandId = getBox().get(BRAND_ID);
    return brandId;
  }

  getBrandName() {
    final brandName = getBox().get(BRAND_NAME);
    return brandName;
  }

  getVehicleName() {
    final vehicleName = getBox().get(VEHICLE_NAME);
    return vehicleName;
  }

  getVehicleId() {
    final vehicleId = getBox().get(VEHICLE_ID);
    return vehicleId;
  }

  getToken() {
    final token = getBox().get(TOKEN);
    return token;
  }

  setFirebaseToken(String token) async {
    getBox().put(FIREBASE_TOKEN, token);
  }

  getFirebaseToken() async {
    return getBox().get(FIREBASE_TOKEN);
  }
}
