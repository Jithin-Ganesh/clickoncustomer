import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/providers/category-provider.dart';

import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';

import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:provider/provider.dart';

import '../../../providers/home_provider.dart';
import '../../../utils/constants/fontStyles/kanit.dart';
import '../../../utils/img-provider-2.dart';

class GroupOrders extends StatelessWidget {
  const GroupOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 570,
      decoration: containerDecorationShadow,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 30.0, right: 29, top: 25, bottom: 42),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/icon-group-orders.png",
                      height: 34,
                      width: 36,
                    ),
                    SizedBox(
                      width: 7,
                    ),
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
                Row(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          "assets/images/icon-wallet.png",
                          height: 31,
                          width: 33,
                        ),
                        SizedBox(
                          width: 9,
                        ),
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
            Consumer<CategoryProvider>(
              builder: (context, value, child) => SizedBox(
                height: 420,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: value.latestProducts?.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: GroupOrderItem(
                      product: value.latestProducts?[index],
                    ),
                  ),
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
  const GroupOrderItem({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 225,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: primaryColor, width: 3),
                ),
                child: ImgProvider2(
                  url: product?.thumbnail ?? '',
                  height: 254,
                  width: 225,
                  radius: 10,
                  boxFit: BoxFit.fill,
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
                    style: semiBold.copyWith(color: canvasColor, fontSize: 14),
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
          LinearPercentIndicator(
            width: MediaQuery.of(context).size.width * 0.114,
            animation: true,
            lineHeight: 10,
            animationDuration: 2500,
            percent: 0.45,
            linearStrokeCap: LinearStrokeCap.roundAll,
            barRadius: Radius.circular(10),
            progressColor: ratingColor,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 21,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
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
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: buyersBorderColor),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    children: [
                      Text(
                        'Price ',
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
                  borderRadius: BorderRadius.circular(5),
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
            height: 44,
            width: 225,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            ' For Each Affiliate Buy=  ',
                            style: regular.copyWith(
                                color: Colors.white, fontSize: 12),
                          ),
                          Text(
                            '100',
                            style: medium.copyWith(
                                color: Colors.white, fontSize: 14),
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
    );
  }
}
