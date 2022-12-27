import 'package:flutter/material.dart';

import 'color.dart';
import 'fontstyles.dart';

BoxDecoration containerDecoration =
    BoxDecoration(color: canvasColor, borderRadius: BorderRadius.circular(10));


BoxDecoration splashDecoration = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/splash.png'), fit: BoxFit.fill));


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
BoxDecoration boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  color: canvasColor,
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      offset: Offset(0.0, 1.0), //(x,y)
      blurRadius: 10.0,
    ),
  ],
);

BoxDecoration zigzagDecoration = BoxDecoration(
  color: canvasColor,
  image: DecorationImage(
    image: AssetImage('assets/images/image-zigzag-bg.png')
  ),
  boxShadow: [
    BoxShadow(
      color: Colors.grey,
      offset: Offset(0.0, 1.0), //(x,y)
      blurRadius: 6.0,
    ),
  ],
);


InputDecoration dropDownSearchDecoration = InputDecoration(
  hintText: '',
  hintStyle: medium,
  // contentPadding:Edge,
  isDense: true,
  labelStyle: medium.copyWith(fontSize: 12, color: accentColor),
  filled: true,
  fillColor: bgBoxColor,
  focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(36),
      borderSide: BorderSide.none),
  errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(36),
      borderSide: BorderSide.none),
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(36),
      borderSide: BorderSide.none),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(36),
      borderSide: BorderSide.none),
);


InputDecoration dropDownDecoration =  InputDecoration(
    hintText: '',
    filled: true,
    fillColor: Colors.white,
    contentPadding: EdgeInsets.only(left: 20),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: gray5),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: gray5),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: gray5),
    ));