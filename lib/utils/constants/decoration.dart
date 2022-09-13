import 'package:flutter/material.dart';

import 'color.dart';

BoxDecoration containerDecoration =
    BoxDecoration(color: canvasColor, borderRadius: BorderRadius.circular(10));

BoxDecoration elevatedDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(5.0),
  color: canvasColor,
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      offset: Offset(0.0, 1.0), //(x,y)
      blurRadius: 6.0,
    ),
  ],
);


BoxDecoration zigzagDecoration = BoxDecoration(
  color: canvasColor,
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      offset: Offset(0.0, 1.0), //(x,y)
      blurRadius: 6.0,
    ),
  ],
);