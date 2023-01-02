import 'package:clickoncustomer/utils/global-key.dart';
import 'package:flutter/material.dart';

void showSnackBar({ String? message, required BuildContext context, bool isSuccess = true}) {
try{

  // ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(snackBar);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message??''),
    backgroundColor: isSuccess?Colors.green.shade600: Colors.orangeAccent,

  ));
}catch(e){
  print(e.toString());
}
}
