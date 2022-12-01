import 'package:flutter/material.dart';

void showSnackBar({required String message, required BuildContext context, bool isSuccess = true}) {
  SnackBar _snackBar = SnackBar(
    content: Text(message),
    backgroundColor: isSuccess?Colors.green.shade600: Colors.orangeAccent,

  );
  ScaffoldMessenger.of(context).showSnackBar(_snackBar);
}
