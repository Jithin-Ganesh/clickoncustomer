import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/fontstyles.dart';

class RatingBox extends StatelessWidget {
  const RatingBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 22,
      width: 61,
      decoration: BoxDecoration(
          color: ratingColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.star_half,
            color: canvasColor,
            size: 18,
          ),
          SizedBox(width: 3,),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: Text(
              '4.4',
              style: medium.copyWith(color: canvasColor, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
