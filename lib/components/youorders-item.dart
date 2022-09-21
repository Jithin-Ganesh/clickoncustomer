import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YourOrder extends StatelessWidget {
  YourOrder(
      {Key? key,
      this.selectedValue,
      required this.description,
      required this.title,
      required this.itemName,
      required this.amount,
      required this.firstIcon,
      required this.isArriving,
      required this.buttonStatus,
      required this.buttonText1,
      required this.buttonText2,
      required this.itemImage,
      required this.secondIcon})
      : super(key: key);

  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  late final String? selectedValue;
  final bool buttonStatus;
  final String buttonText1;
  final String buttonText2;
  final String firstIcon;
  final String secondIcon;
  final String title;
  final String description;
  final String itemName;
  final String itemImage;
  final String amount;
  final bool isArriving;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Container(
        width: 1202,
        height: 217,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: canvasColor),
        child: Padding(
          padding: const EdgeInsets.only(right: 42, left: 24, top: 22),
          child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox( width: MediaQuery.of(context).size.width * 0.453,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImgProvider(
                                url: firstIcon,
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                title,
                                style: medium.copyWith(
                                    fontSize: 18,
                                    color: isArriving
                                        ? primaryColor
                                        : checkedItemsColor),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImgProvider(
                                url: secondIcon,
                                width: 10,
                                height: 10,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                description,
                                style: regular.copyWith(
                                    fontSize: 14,
                                    color: isArriving
                                        ? deliveryDateColor
                                        : priceDetailsSubTextColor),
                              )
                            ],
                          )
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            textOrder,
                            style: regular.copyWith(
                                fontSize: 14, color: priceDetailsSubTextColor),
                          ),
                          SizedBox(
                            width: 42,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                                hint: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(textOrderPlaced,
                                        style: regular.copyWith(
                                            fontSize: 14,
                                            color: orderPlacedTextColor)),
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
                          SizedBox(
                            width: 33,
                          ),
                          DropdownButtonHideUnderline(
                            child: DropdownButton2(
                                hint: Row( crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Text(textShipTo,
                                        style: regular.copyWith(
                                            fontSize: 14,
                                            color: orderPlacedTextColor)),
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
                          SizedBox(
                            width: 22,
                          ),
                          ImgProvider(
                            url: "assets/images/img_34.png",
                            width: 18,
                            height: 18,
                            border: Border.all(color: vectorColor),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 33,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 34,
                    ),
                    ImgProvider(
                      url: itemImage,
                      width: 90,
                      height: 71,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width *  0.304,
                          child: Text(
                            itemName,maxLines: 2,overflow: TextOverflow.ellipsis,
                            style: regular.copyWith(
                                fontSize: 14, color: orderPlacedTextColor),
                          ),
                        ),
                        Row(
                          children: [
                            Text(textRupees),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              amount,
                              style: medium.copyWith(
                                  fontSize: 17,
                                  color: productDetailsScreenTextColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.111,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          textViewOrderDetails,
                          style: medium.copyWith(
                              fontSize: 14,
                              color: productDetailsScreenTextColor),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: productDetailsScreenTextColor,
                          size: 10,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.111,
                  height: 38,
                  decoration: BoxDecoration(
                      color: buttonStatus ? primaryColor : Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      textAlign: TextAlign.center,
                      buttonText1,
                      style: medium.copyWith(
                          fontSize: 14,
                          color: buttonStatus ? Colors.white : passColor),
                    ),
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.111,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      textAlign: TextAlign.center,
                      buttonText2,
                      style: medium.copyWith(
                          fontSize: 14, color: productDetailsScreenTextColor),
                    ),
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
