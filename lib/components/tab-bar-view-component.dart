import 'package:clickoncustomer/utils/constants/fontStyles/kanit.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/color.dart';

class TabBarViewItem extends StatelessWidget {
  const TabBarViewItem({Key? key, required this.image, required this.text})
      : super(key: key);
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: templateContainerColor,
      ),
      width: 120,
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 25, right: 26, top: 7, bottom: 7),
        child: Row(children: [
          ImgProvider(
            url: image,
            color: templateContainerColor,
            width: 16,
            height: 14,
          ),
          const SizedBox(
            width: 6,
          ),
          Text(
            text,
            style: sansMedium.copyWith(fontSize: 16, color: Colors.black),
          )
        ]),
      ),
    );
  }
}
