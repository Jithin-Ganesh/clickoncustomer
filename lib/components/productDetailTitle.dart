import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/images.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProductDetailTitle extends StatelessWidget {
  ProductDetailTitle({Key? key}) : super(key: key);

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: primaryColor,
      width: MediaQuery.of(context).size.width * 1,
      height: 151.9,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(mainAxisAlignment: MainAxisAlignment.start,
            children: [
          IconButton(
              onPressed: () {},
              icon: Stack(children: [
                Image.asset(
                  circledArrow,
                  width: 32,
                  height: 32,
                ),

                Positioned(
                  top: 8,
                  left: 9,
                  child: Image.asset(
                    backArrow,
                    width: 5,
                    height: 10,
                  ),
                )
              ])),
          Text(
            itemDescription,
            style: medium.copyWith(fontSize: 24, color: defaultTextColor),
          ),
        ]),
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Stack(children: [
                      Image.asset(
                        ratingBoxImage,
                        width: 61,
                        height: 22,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: [
                            Image.asset(
                              ratingStarImage,
                              width: 13,
                              height: 12,
                            ),
                            const SizedBox(
                              width: 3,
                            ),
                            Text(
                              rating,
                              style: medium.copyWith(
                                  color: defaultTextColor, fontSize: 14),
                            )
                          ],
                        ),
                      )
                    ]),
                    const SizedBox(
                      width: 7,
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          discountBoxImage,
                          width: 49,
                          height: 22,
                        ),
                        Positioned(
                          left: 12,
                          child: Text(
                            discount,
                            style: medium.copyWith(
                                color: primaryColor, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 13,
                    ),
                    Text(
                      textRupees,
                      style: regular.copyWith(
                          color: defaultTextColor, fontSize: 22),
                    ),
                    Text(
                      textAmount,
                      style: regular.copyWith(
                          fontSize: 28, color: defaultTextColor),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      textMrp,
                      style: regular.copyWith(
                          fontSize: 14, color: defaultTextColor),
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      textActualAmount,
                      style: regular.copyWith(
                          fontSize: 14,
                          color: defaultTextColor,
                          decoration: TextDecoration.lineThrough,
                          decorationColor: defaultTextColor),
                    )
                  ],
                )
              ],
            ),SizedBox(width: 16,),
            Container(
              height: 40,
              width: 92,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: const BorderSide(width: 1.0, color: defaultTextColor),
                ),
                onPressed: () {},
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                      hint: Row(
                        children: [
                          Text(quantityText,
                              style: regular.copyWith(
                                  fontSize: 14, color: defaultTextColor)),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            count,
                            style: regular.copyWith(
                                fontSize: 16, color: defaultTextColor),
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
            ),
            const SizedBox(
              width: 13,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              textColor: primaryColor,
              onPressed: () {},
              color: defaultTextColor,
              minWidth: 147,
              height: 40,
              child: Text(
                buyNow,
                style: medium.copyWith(fontSize: 16, color: primaryColor),
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Container(
              width: 139,
              height: 40,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  side: const BorderSide(width: 1.0, color: defaultTextColor),
                ),
                child: Text(
                  addToCart,
                  style: medium.copyWith(color: defaultTextColor, fontSize: 16),
                ),
              ),
            ),
          ],
        )
      ]),
    ));
  }
}
