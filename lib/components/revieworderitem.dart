import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/strings.dart';

class ReviewOrderItem extends StatelessWidget {
  ReviewOrderItem(
      {Key? key,
      required this.title,
      this.selectedValue,
      required this.isOrder,
      required this.isGift,
      required this.itemName,
      required this.price,
      required this.offerPrice})
      : super(key: key);
  final String title;
  final String itemName;

  final bool isOrder;
  final bool isGift;
  final String price;
  final String offerPrice;

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  late final String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImgProvider(
                url: "assets/images/img_22.png",
                width: 12,
                height: 8,
              ),
              SizedBox(width: 11),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        deliveryText,
                        style: medium.copyWith(
                            fontSize: 18, color: priceOffersSubtextColor),
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        title,
                        style: medium.copyWith(
                            fontSize: 18, color: checkedItemsColor),
                      ),
                    ],
                  ),
                  isOrder
                      ? Text(orderStatusText,
                          style: thin.copyWith(
                              fontSize: 14, color: subTextGeneralColor))
                      : SizedBox(
                          width: 0,
                        ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                width: 110,
                height: 110,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: itemContainer, width: 1)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 14, right: 16),
                  child: const ImgProvider(
                    url: "assets/images/img_21.png",
                    width: 77,
                    height: 77,
                  ),
                ),
              ),
              SizedBox(
                width: 32,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    itemName,
                    style: regular.copyWith(
                        fontSize: 16, color: productSubTextColor),
                  ),
                  Text(
                    soldByText,
                    style: thin.copyWith(
                        fontSize: 14, color: productDetailsScreenSubTextColor),
                  ),
                  Row(
                    children: [
                      Text(
                        textRupees,
                        style:
                            regular.copyWith(fontSize: 18, color: primaryColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        price,
                        style:
                            medium.copyWith(fontSize: 17, color: primaryColor),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Text(
                        textRupees,
                        style: regular.copyWith(
                          decoration: TextDecoration.lineThrough,
                          decorationColor: offerPriceColor,
                          color: offerPriceColor,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        offerPrice,
                        style: medium.copyWith(
                            decoration: TextDecoration.lineThrough,
                            decorationColor: offerPriceColor,
                            fontSize: 17,
                            color: offerPriceColor),
                      ),
                      SizedBox(
                        width: 26,
                      ),
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
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: qtyButtonColor, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 28,
                        width: 76,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                              hint: Row(
                                children: [
                                  SizedBox(
                                    width: 12,
                                  ),
                                  Text(yourCartQuantityText,
                                      style: regular.copyWith(
                                          fontSize: 12,
                                          color: productSubTextColor)),
                                  const SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    count,
                                    style: regular.copyWith(
                                        fontSize: 14,
                                        color: productSubTextColor),
                                  )
                                ],
                              ),
                              items: items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              value: selectedValue,
                              onChanged: (value) {
                                selectedValue = value as String;
                              }),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      isGift
                          ? Container(
                              width: 170,
                              height: 30,
                              decoration: const BoxDecoration(
                                color: addGiftButtonColor,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 23,
                                  ),
                                  ImgProvider(
                                    url: "assets/images/img_24.png",
                                    width: 12,
                                    height: 12,
                                  ),
                                  const SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    textAddGiftOptions,
                                    style: regular.copyWith(
                                        fontSize: 12, color: Colors.white),
                                  ),
                                ],
                              ))
                          : Container(
                              width: 170,
                              height: 30,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: addGiftBorderColor, width: 1.5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 23,
                                  ),
                                  ImgProvider(
                                    url: "assets/images/img_24.png",
                                    width: 12,
                                    height: 12,
                                    color: addGiftButtonColor,
                                  ),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text(
                                    textAlign: TextAlign.center,
                                    textAddGiftOptions,
                                    style: regular.copyWith(
                                        fontSize: 12, color: mainTitleColor),
                                  ),
                                ],
                              ))
                    ],
                  )
                ],
              )
            ],
          ),
        ]),
      ),
    );
  }
}
