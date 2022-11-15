import 'package:flutter/material.dart';
import 'global-key.dart';
void showMessage({required String message, bool isSuccess = true}) {
  SnackBar _snackBar = SnackBar(
    content: Text(message??''),
    backgroundColor: isSuccess?Colors.green.shade600: Colors.orangeAccent,

  );
  ScaffoldMessenger.of(navigatorKey.currentContext!).showSnackBar(_snackBar);
}