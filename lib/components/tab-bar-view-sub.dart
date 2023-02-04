import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/color.dart';
import '../utils/constants/fontStyles/kanit.dart';
import '../utils/img-provider.dart';

class TabBarViewSub extends StatelessWidget {
  const TabBarViewSub({Key? key, required this.text, required this.image}) : super(key: key);
final String text; final String image;
  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      ImgProvider(
        url: image,color:templateBgColor ,
        width: 16,
        height: 14,
      ),
      SizedBox(
        width: 6,
      ),
      Text(
        text,
        style: sansMedium.copyWith(fontSize: 16, color: Colors.black),
      )
    ]);
  }
}
