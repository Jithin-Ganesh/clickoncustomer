import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/providers/category-provider.dart';

import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';

import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/home_provider.dart';
import '../../../utils/constants/fontstyles.dart';

class GroupOrders extends StatelessWidget {
  const GroupOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      decoration: containerDecoration,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30.0, right: 29, top: 25, bottom: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 35.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/icon-group-orders.png",
                        height: 34,
                        width: 36,
                      ),
                      SizedBox(width: 7,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Group',
                            style: semiBold.copyWith(
                                fontSize: 16,
                                color: outlinedButtonColor,
                                height: 1),
                          ),
                          Text(
                            'Orders',
                            style: semiBold.copyWith(
                                fontSize: 22,
                                color: groupOrdersTitleTextColor,
                                height: 1),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/icon-wallet.png",
                          height: 31,
                          width: 33,
                        ),
                        SizedBox(width: 9,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Mywallet',
                              style: thin.copyWith(
                                  fontSize: 14, color: outlinedButtonColor),
                            ),
                            Text(
                              '(\$15)',
                              style: semiBold.copyWith(
                                  fontSize: 22, color: outlinedButtonColor),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 63,
                    ),
                    Row(
                      children: [
                        Text(
                          'View All',
                          style: medium.copyWith(
                              fontSize: 14, color: groupOrdersTitleTextColor),
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: circleBorderColor,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/icon-arrow-right.png",
                              color: primaryColor,
                              height: 11,
                              width: 11,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            Consumer<HomeProvider>(
              builder: (context, value, child) => SizedBox(
                height: 420,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.products?.length,
                  itemBuilder: (context, index) => GroupOrderItem(
                       product: value.products?[index],),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class GroupOrderItem extends StatelessWidget {
final ProductModel? product;
  const GroupOrderItem(
      {Key? key,
      required this.product})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Container(
        width: 225,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: primaryColor, width: 3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ImgProvider(
                      url: product?.images ?? '',
                      height: 254,
                      width: 225,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    height: 34,
                    width: 40,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: primaryColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/images/icon-share.png",
                        height: 15,
                        width: 14,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 51,
                  right: 51,
                  child: Container(
                    height: 24,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          topLeft: Radius.circular(10)),
                      color: primaryColor,
                    ),
                    child: Center(
                        child: Text(
                      '03 : 11 : 42',
                      style:
                          semiBold.copyWith(color: canvasColor, fontSize: 14),
                    )),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₹${product?.price}',
                  style: regular.copyWith(
                      fontSize: 24, color: groupOrdersAmountTextColor),
                ),
                Container(
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: soldBorderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Center(
                      child: Text(
                        'Sold',
                        style: semiBold,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: buyersBorderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'Buyers',
                          style: thin.copyWith(
                              fontSize: 10, color: groupOrdersValuesColor),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '10',
                          style: medium.copyWith(
                              fontSize: 14, color: groupOrdersValuesColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: buyersBorderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'Buyers',
                          style: thin.copyWith(
                              fontSize: 10, color: groupOrdersValuesColor),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${product?.price}',
                          style: medium.copyWith(
                              fontSize: 14, color: groupOrdersValuesColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 21,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: buyersBorderColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: [
                        Text(
                          'Wallet',
                          style: thin.copyWith(
                              fontSize: 10, color: groupOrdersValuesColor),
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          '10',
                          style: medium.copyWith(
                              fontSize: 14, color: groupOrdersValuesColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 9,
            ),
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                color: groupOrdersValuesColor,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/icon-crown.png",
                      height: 11,
                      width: 16,
                    ),
                    const SizedBox(
                      width: 7,
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'For Each Affiliate Buy=  ',
                              style: regular.copyWith(
                                  color: canvasColor, fontSize: 12),
                            ),
                            Text(
                              '100',
                              style: medium.copyWith(
                                  color: canvasColor, fontSize: 14),
                            ),
                          ],
                        ),
                        Text(
                          ' Reward Points',
                          style:
                              medium.copyWith(color: canvasColor, fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
