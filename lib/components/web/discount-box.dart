import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/fontstyles.dart';

class DiscountBox extends StatelessWidget {
  const DiscountBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 61,
      decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '10%',
            style: medium.copyWith(color: primaryColor, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
