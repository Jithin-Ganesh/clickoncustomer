import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';

import '../utils/constants/map-key.dart';
import 'package:http/http.dart' as http;

class LocationProvider extends ChangeNotifier{
  Future<String> fetchLocationDetails() async {
    final response = await http.get(Uri.parse("https://maps.googleapis.com/maps/api/geocode/json?latlng=9.5916,76.5222&key=$GOOGLE_API_KEY"));

    final responseBody = jsonDecode(response.body);
    print('printing location details ${responseBody["plus_code"]["compound_code"]}');

    // return LocationPrediction.fromJson(responseBody["result"]);
    return "${responseBody["plus_code"]["compound_code"]}";
  }
}