import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../utils/constants/color.dart';
import '../../utils/constants/fontstyles.dart';
import '../elevated-buton.dart';

class ZigZagSheet extends StatelessWidget {
  const ZigZagSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 371,
      child: ClipPath(
          clipper: MovieTicketBothSidesClipper(),
          child: Container(
            width: 371,
            alignment: Alignment.center,
            decoration: zigzagDecoration,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 55.0, horizontal: 30),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                      width: 310,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Proceed to Buy',
                          style:
                              medium.copyWith(color: canvasColor, fontSize: 16),
                        ),
                      ),
                    ),
                    // ButtonElevated(
                    //   buttonTitle: 'Proceed to Buy',
                    //   height: 40,
                    //   width: 310,
                    //   color: primaryColor,
                    //   textStyle:
                    //       medium.copyWith(color: canvasColor, fontSize: 16),
                    // ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Price Details',
                      style:
                          medium.copyWith(color: mainTitleColor, fontSize: 20),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 19,
                    ),
                    Divider(
                      thickness: 1,
                      color: dividerColor2,
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    PriceItem(title: 'Price (3 items)', value: '9,053.00'),
                    SizedBox(
                      height: 5,
                    ),
                    PriceItem(title: 'Shipping', value: 'Free'),
                    SizedBox(
                      height: 5,
                    ),
                    PriceItem(title: 'Discount', value: '-1000.00'),
                    SizedBox(
                      height: 52,
                    ),
                    Divider(
                      thickness: 1,
                      color: dividerColor2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Subtotal',
                          style: medium.copyWith(
                              color: mainTitleColor, fontSize: 16),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          '8,053.00',
                          style: regular.copyWith(
                              color: productAvailabilityColor, fontSize: 28),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )
                  ]),
            ),
          )),
    );
  }
}

class PriceItem extends StatelessWidget {
  final String title;
  final String value;
  const PriceItem({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: thin.copyWith(color: priceDetailsSubTextColor, fontSize: 14),
          textAlign: TextAlign.left,
        ),
        Text(
          value,
          style: regular.copyWith(color: mainTitleColor, fontSize: 14),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
