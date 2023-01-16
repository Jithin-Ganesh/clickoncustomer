import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/fontstyles.dart';

class AccountComponent extends StatelessWidget {
  const AccountComponent(
      {Key? key,
      required this.title,
      required this.description,
      required this.icon,
      required this.isSelected,
      this.onPressed})
      : super(key: key);
  final String icon;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: isSelected ? primaryColor : Colors.white),
        //width: 380,
        height: 130,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ImgProvider(
              url: icon,
              width: 35,
              height: 36,
              boxFit: BoxFit.fill,
              color: isSelected ? primaryColor : Colors.white,
            ),
            SizedBox(
              width: 16,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  child: Text(
                    title,maxLines: 1,
                    style: medium.copyWith(
                        fontSize: 20, overflow: TextOverflow.ellipsis,
                        color: isSelected
                            ? Colors.white
                            : productDetailsScreenTextColor),
                  ),
                ),
                SizedBox(
                  height: 6,
                ),
                Flexible(
                  child: Text(
                    description,maxLines: 2,
                    style: regular.copyWith(
                        fontSize: 14, overflow: TextOverflow.ellipsis,
                        color: isSelected ? Colors.white : discountPriceColor),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
