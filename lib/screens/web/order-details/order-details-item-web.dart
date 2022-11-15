import 'package:clickoncustomer/screens/web/order-feedback/order-seller-feedback-screen-web.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/images.dart';
import '../../../utils/img-provider.dart';

class OrderDetailsItemWeb extends StatelessWidget {
  const OrderDetailsItemWeb({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: containerDecoration,
        child: Padding(
            padding: const EdgeInsets.only(right: 43, left: 34, top: 50,bottom: 40),
            child: Column(mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    textOrderStatus,
                                    style: medium.copyWith(
                                        color: priceDetailsSubTextColor,
                                        fontSize: 14),
                                  ),
                                  SizedBox(
                                    height: 23,
                                  ),
                                  Row(
                                    children: [
                                      ImgProvider(
                                        url: processingImage,
                                        width: 20,
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 7,
                                      ),
                                      Text(
                                        textArrivingFriday,
                                        style: medium.copyWith(
                                            fontSize: 18, color: primaryColor),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      ImgProvider(
                                        url: "assets/images/img_33.png",
                                        width: 10,
                                        height: 10,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        textPreparingForDispatch,
                                        style: regular.copyWith(
                                            fontSize: 14,
                                            color: deliveryDateColor),
                                      )
                                    ],
                                  )
                                ]),
                            VerticalDivider(width: 90,
                              color: divColor,
                              thickness: 1,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textShippingAddress,
                                  style: medium.copyWith(
                                      color: priceDetailsSubTextColor,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Text(
                                  textcustomerDeatils,
                                  style: thin.copyWith(
                                      fontSize: 14, color: productSubTextColor),
                                ),
                              ],
                            ),
                            VerticalDivider(width: 90,
                              color: divColor,
                              thickness: 1,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textOrderSummary,
                                  style: medium.copyWith(
                                      color: priceDetailsSubTextColor,
                                      fontSize: 14),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      textGrandTotal,
                                      style: medium.copyWith(
                                          color: productDetailsScreenTotalColor,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      textRupees,
                                      style: regular.copyWith(
                                          fontSize: 18,
                                          color: priceDetailsSubTextColor),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      textYourOrderAmount,
                                      style: medium.copyWith(
                                          color: productDetailsScreenTotalColor,
                                          fontSize: 17),
                                    ),
                                  ],
                                ),
                                Text(
                                  textFreeDelivery,
                                  style: regular.copyWith(
                                      fontSize: 14, color: productSubTextColor),
                                )
                              ],
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Column(children: [
                              Container(
                                width: 215,
                                height: 38,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                                child: OutlinedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, OrderSellerFeedBackScreenWeb.routeName);
                                  },
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Leave seller feedback",
                                    style: medium.copyWith(
                                        fontSize: 14,
                                        color: productDetailsScreenTextColor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: 215,
                                height: 38,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Leave delivery feedback",
                                    style: medium.copyWith(
                                        fontSize: 14,
                                        color: productDetailsScreenTextColor),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                width: 215,
                                height: 38,
                                decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5))),
                                child: OutlinedButton(
                                  onPressed: () {},
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    "Write a product review",
                                    style: medium.copyWith(
                                        fontSize: 14,
                                        color: productDetailsScreenTextColor),
                                  ),
                                ),
                              ),
                            ])
                          ],
                        )
                      ]),
                  SizedBox(
                    height: 103,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Row(
                          children: [
                            ImgProvider(
                              url: "assets/images/img_35.png",
                              width: 90,
                              height: 71,
                            ),
                            SizedBox(
                              width: 34,
                            ),
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  textYouOrderItemName,
                                  style: regular.copyWith(
                                      fontSize: 14, color: orderPlacedTextColor),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      height: 16,
                                      width: 37,
                                      decoration: const BoxDecoration(
                                          color: discountBoxColor,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              bottomRight: Radius.circular(8))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 0.69),
                                        child: Text(
                                          discount,
                                          textAlign: TextAlign.center,
                                          style: regular.copyWith(
                                              fontSize: 12, color: defaultTextColor),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      textYourCartOffer,
                                      style: medium.copyWith(
                                          fontSize: 12, color: mainTitleColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ]),
                      Row(
                        children: [
                          Container(
                            width: 215,
                            height: 38,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.all(Radius.circular(5))),
                            child: OutlinedButton(
                              onPressed: () {},
                              child: Text(
                                textAlign: TextAlign.center,
                                "Cancel Order",
                                style: medium.copyWith(
                                    fontSize: 14,
                                    color: productDetailsScreenTextColor),
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ])));
  }
}
