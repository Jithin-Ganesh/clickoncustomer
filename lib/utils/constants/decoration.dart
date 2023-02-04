import 'package:flutter/material.dart';

import 'color.dart';
import 'fontStyles/kanit.dart';

BoxDecoration containerDecoration =
    BoxDecoration(color: canvasColor, borderRadius: BorderRadius.circular(10));


BoxDecoration splashDecoration = const BoxDecoration(
    image: DecorationImage(
        image: AssetImage('assets/images/splash.png'), fit: BoxFit.fill));



const shimmerGradient = LinearGradient(
  colors: [
    Color(0xFFEBEBF4),
    Color(0xFFF4F4F4),
    Color(0xFFEBEBF4),
  ],
  stops: [
    0.1,
    0.3,
    0.4,
  ],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
  tileMode: TileMode.clamp,
);

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
  // image: DecorationImage(
  //   fit: BoxFit.fill,
  //   image: Image.asset('assets/images/image-zigzag-bg.png',   fit: BoxFit.fill,).image,
  // ),
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