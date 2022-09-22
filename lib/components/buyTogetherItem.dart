import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/images.dart';

class BuyTogetherItem extends StatelessWidget {
  final String image;
  final String description;
  final String price;

  const BuyTogetherItem(
      {Key? key,
      required this.image,
      required this.description,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.1302,
      child: Column(children: [
        Image.asset(
          image,
          height: 135,
          width: MediaQuery.of(context).size.width * 0.0703,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
                value: true,
                onChanged: (bool? value) {},
              )),
          const SizedBox(
            width: 19.15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: thin.copyWith(fontSize: 12, color: productSubTextColor,),maxLines: 2,
                ),
                const SizedBox(
                  height: 4.16,
                ),
                Text(
                  textRupees + price,
                  style: regular.copyWith(
                      fontSize: 16, color: groupOrdersAmountTextColor),
                )
              ],
            ),
          ),
        ])
      ]),
    );
  }
}
