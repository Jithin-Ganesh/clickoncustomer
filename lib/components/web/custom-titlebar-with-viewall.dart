import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/fontstyles.dart';


class CustomTitleBarViewAll extends StatelessWidget {
  final String title;
  const CustomTitleBarViewAll({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: medium.copyWith(color: Colors.black,fontSize: 28),textAlign: TextAlign.left,),
        Row(
          children: [
            Text('ViewAll',style: medium.copyWith(color: groupOrdersTitleTextColor),),
            SizedBox(width: 5,),
            Image.asset(
              "assets/images/icon-arrow-right.png",
              color: primaryColor,
              height: 11,
              width: 11,
            )
          ],
        )
      ],
    );
  }
}
