import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/fontstyles.dart';
import '../../utils/constants/strings.dart';

class OrderDetailsTitleBar extends StatelessWidget {
  const OrderDetailsTitleBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 57,
      width: MediaQuery.of(context).size.width * 0.626,
      decoration: containerDecoration,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 38.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  textOrder,
                  style: regular.copyWith(
                      fontSize: 14, color: priceDetailsSubTextColor),
                ),
                Text(
                  'Order Placed',
                  style: medium.copyWith(
                      fontSize: 14, color: priceDetailsSubTextColor),
                ),
                Text(
                  ' on 11 September 2022 ',
                  style: regular.copyWith(
                      fontSize: 14, color: priceDetailsSubTextColor),
                ),
              ],
            ),
            SizedBox(width: 41,),
            Row(
              children: [
               ImgProvider(url: 'assets/images/icon-download-blue.png',height: 17,width: 14,),
                Text(
                  'Download Invoice',
                  style: regular.copyWith(
                      fontSize: 14, color: primaryColor),
                ),
                SizedBox(width: 34,),
                Icon(Icons.archive_outlined,size: 18,),
                Text(
                  'Archive Order',
                  style: regular.copyWith(
                      fontSize: 14, color: vectorColor),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
