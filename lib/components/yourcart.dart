import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourCart extends StatelessWidget {
  YourCart({Key? key, this.selectedValue}) : super(key: key);
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
      color: defaultTextColor,
      width: 1196,
      height: 166,
      child: Padding(
        padding: const EdgeInsets.only(right: 38, left: 24),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 24,
                      ),
                      Image.asset(
                        yourCartItemImage,
                        width: 110,
                        height: 110,
                      ),
                      SizedBox(
                        width: 32,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            textInStock,
                            style: medium.copyWith(
                                color: inStockTitleColor, fontSize: 12),
                          ),
                          Text(
                            textYourCartItemName,
                            style: regular.copyWith(
                                fontSize: 14, color: productSubTextColor),
                          ),
                          Row(children: [
                            Text(textRupees),
                            const SizedBox(
                              width: 8.85,
                            ),
                            Text(
                              yourCartAmount,
                              style: medium.copyWith(
                                  color: priceOffersSubtextColor, fontSize: 16),
                            ),
                            const SizedBox(
                              width: 18,
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
                                  fontSize: 12, color: priceOffersSubtextColor),
                            )
                          ]),
                          SizedBox(
                            height: 7.72,
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: qtyButtonColor, width: 2),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(5)),
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
                                          .map((item) =>
                                              DropdownMenuItem<String>(
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
                                width: 16,
                              ),
                              Text(
                                textYourCartSaveForLater,
                                style: regular.copyWith(
                                    color: yourCartSubTextColor, fontSize: 12),
                              ),
                              SizedBox(
                                width: 13,
                              ),
                              Text(
                                textSeprator,
                                style: thin.copyWith(
                                  fontSize: 14,
                                  color: yourCartSubTextColor,
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                textYourCartRemove,
                                style: regular.copyWith(
                                    fontSize: 12, color: removeColor),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Text(
                        yourCartDeliveryDate,
                        style: regular.copyWith(
                            fontSize: 12, color: productSubTextColor),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        textYourCartFree,
                        style:
                            medium.copyWith(color: primaryColor, fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 8.5,
                  ),
                  Row(
                    children: [
                      Text(
                        textChangeDeliveryType,
                        style: regular.copyWith(
                            fontSize: 12, color: productSubTextColor),
                      ),
                      SizedBox(
                        width: 7,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: qtyButtonColor, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        height: 33,
                        width: 87,
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton2(
                              hint: Row(
                                children: [
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(textYourCartCOD,
                                      style: regular.copyWith(
                                          fontSize: 14,
                                          color: reviewSubTitleColor)),
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
                    ],
                  )
                ],
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
