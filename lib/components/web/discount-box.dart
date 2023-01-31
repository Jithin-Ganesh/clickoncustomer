import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/fontstyles.dart';


class DiscountBox extends StatelessWidget {
  final String discount;
  const DiscountBox({Key? key, required this.discount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 49,
      decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), bottomRight: Radius.circular(12))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$discount%',
            style: semiBold.copyWith(color: primaryColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
