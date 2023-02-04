import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/fontStyles/kanit.dart';

class SimilarProducts extends StatelessWidget {
  final String image;

  final double price;
  final double offerPrice;
  const SimilarProducts(
      {Key? key,
      required this.image,
      required this.price,
      required this.offerPrice})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: 300,
        height: 400,
        child: Column(
          children: [
            Container(
              color: defaultTextColor,
              width: 197,
              height: 257,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(children: [
                        Image.asset(
                          onSaleImage,
                          width: 76,
                          height: 24,
                        ),
                        Positioned(
                          left: 15,
                          top: 3,
                          child: Text(
                            textOnSale,
                            style: regular.copyWith(
                                fontSize: 12, color: productsTitleColor),
                          ),
                        )
                      ]),
                      Padding(
                        padding: const EdgeInsets.only(right: 11,top: 11),
                        child: Stack(children: [
                          Image.asset(
                            circledLoveImage,
                            width: 28,
                            height: 28,
                          ),
                          Positioned(
                            top: 8,
                            left: 8,
                            child: Image.asset(
                              loveImage,
                              width: 14,
                              height: 12,
                            ),
                          )
                        ]),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 49,
                      ),
                      Image.asset(
                        image,
                        width: 117,
                        height: 124,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              itemDescription,
              style: regular.copyWith(fontSize: 12, color: productSubTextColor),
            ),
            const SizedBox(
              height: 45,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  textRupees + price.toString(),
                  style: regular.copyWith(
                      fontSize: 17, color: groupOrdersAmountTextColor),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  textRupees + offerPrice.toString(),
                  style: thin.copyWith(fontSize: 17, color: discountPriceColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
