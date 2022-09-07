import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/images.dart';

class BuyTogether extends StatelessWidget {
  final String image;
  final String description;
  final double price;

  const BuyTogether(
      {Key? key,
      required this.image,
      required this.description,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: 1599,
      width: 340,
      child: Column(children: [
        Image.asset(
          image,
          height: 135,
          width: 135,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [
          SizedBox(
              height: 20,
              width: 20,
              child: Checkbox(
                value: true,
                onChanged: (bool? value) {},
              )),
          const SizedBox(
            width: 19.15,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                description,
                style:
                    regular.copyWith(fontSize: 14, color: defaultTextColor),
              ),
              const SizedBox(
                height: 4.16,
              ),
              Text(
                textRupees + price.toString(),
                style: regular.copyWith(
                    fontSize: 16, color: groupOrdersAmountTextColor),
              )
            ],
          ),
        ])
      ]),
    ));
  }
}
