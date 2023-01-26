/*
  ApiClient is a base client for sending APis from app to the server.
  Why it is used?
  This class can be used in all APi calls so that everything will be loose coupled
  like setting headers, changing base url made very easy
 */

import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/intercepted_client.dart';

import '../api/api_interceptor.dart';

class ApiClient {

  String baseUrl = 'http://34.230.73.43:3000/';  // Development
  //String baseUrl = 'https://api.behica.com/v1/api/'; //Production

  http.Client client() {
    return InterceptedClient.build(interceptors: [ApiInterceptor()]);
  }

  String url(String route) {
    return "$baseUrl$route";
  }
}
