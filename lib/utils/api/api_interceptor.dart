

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';

import '../pref_utils.dart';

class ApiInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      if (data.headers['content-type'] != 'multipart/form-data') {
        data.headers['content-type'] = 'application/json';
      }

      final token = await PrefUtils().getToken();



      // final token =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoia2t1bWFyQGVtZ2VuZXguY29tICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiLCJqdGkiOiIwY2JkZDVkYi0wZDJmLTRiNjMtODgyNC03ZGI5ZjBmZjVmNzciLCJyb2xlIjoiQXBwbGljYXRpb25BZG1pbiIsImV4cCI6MTYwNjMwMTUwMywiaXNzIjoiaHR0cHM6Ly90ZWxlbWVkLmVtZ2VuZXguYXBwL2FwaSIsImF1ZCI6Imh0dHBzOi8vdGVsZW1lZC5lbWdlbmV4LmFwcC9hcGkifQ.bxhrnC2c51PQ1jMkci_Ivd8YLMDPVZkKDtZcIqKxrwg";

      if (token != null) {
        data.headers['x-access-token'] = token;
      }

      // data.headers['BusinessToken'] = "mELirpUhRYksFj7k8/XBcQ==";

    } catch (e) {
      print(e);
    }

    debugPrint(
        "------->Request Start\n${data.method}: ${data.baseUrl} \nHeaders: ${data.headers}\nBody: \n${data.body}\n<----------Request End",wrapWidth: 500);
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    debugPrint(

        "------->Response Start\n${data.method}${data.statusCode}: ${data.url} \nBody: \n${data.body}\n<----------Response End", wrapWidth: 500);

    return data;
  }
}
