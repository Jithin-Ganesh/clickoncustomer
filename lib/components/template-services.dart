import 'package:clickoncustomer/utils/constants/fontStyles/kanit.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/color.dart';

class TemplateServices extends StatelessWidget {
  const TemplateServices({Key? key, required this.image, required this.text})
      : super(key: key);
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment:CrossAxisAlignment.center ,mainAxisSize: MainAxisSize.min,
      children: [
        ImgProvider(
          url: image,
          width: 50,
          height: 50,
          color: templateBgColor,
        ),
        SizedBox(
          width: 30,
        ),
        Text(
          text,
          style: sansMedium.copyWith(fontSize: 16, color: Colors.black),
        )
      ],
    );
  }
}
