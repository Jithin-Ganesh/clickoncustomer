import 'package:clickoncustomer/components/web/discount-box.dart';
import 'package:clickoncustomer/components/web/rating-box.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

import '../providers/cart-provider.dart';

class ProductDetailTitle extends StatelessWidget {
  ProductDetailTitle({Key? key, required this.productId, this.quantity}) : super(key: key);
final int? productId;
final int? quantity;
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: MediaQuery.of(context).size.width * 1,
      height: 98,
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.083,),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            IconButton(
              onPressed: () {},
              icon: Container(
                height: 37,
                width: 37,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: canvasColor.withOpacity(0.5))),
                child: const Center(
                  child: Icon(
                    Icons.keyboard_arrow_left,
                    color: canvasColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
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
                      const RatingBox(),
                      const SizedBox(
                        width: 7,
                      ),
                      const DiscountBox(),
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
              ),
              const SizedBox(
                width: 16,
              ),
              // Container(
              //   height: 40,
              //   width: MediaQuery.of(context).size.width * 0.047,
              //   child: OutlinedButton(
              //     style: OutlinedButton.styleFrom(
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(10)),
              //       side: const BorderSide(width: 1.0, color: defaultTextColor),
              //     ),
              //     onPressed: () {},
              //     child: DropdownButtonHideUnderline(
              //       child: DropdownButton2(
              //           hint: Row(
              //             children: [
              //               Text(quantityText,
              //                   style: regular.copyWith(
              //                       fontSize: 14, color: defaultTextColor)),
              //               const SizedBox(
              //                 width: 4,
              //               ),
              //               Text(
              //                 count,
              //                 style: regular.copyWith(
              //                     fontSize: 16, color: defaultTextColor),
              //               )
              //             ],
              //           ),
              //           items: items
              //               .map((item) => DropdownMenuItem<String>(
              //                     value: item,
              //                     child: Text(
              //                       item,
              //                       style: const TextStyle(
              //                         fontSize: 14,
              //                       ),
              //                     ),
              //                   ))
              //               .toList(),
              //           value: selectedValue,
              //           onChanged: (value) {
              //             selectedValue = value as String;
              //           }),
              //     ),
              //   ),
              // ),
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
              const SizedBox(
                width: 14,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.072,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false)
                        .addCart(productId: productId, qty: quantity);
                  },
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    side: const BorderSide(width: 1.0, color: defaultTextColor),
                  ),
                  child: Text(
                    addToCart,
                    style:
                        medium.copyWith(color: defaultTextColor, fontSize: 16),
                  ),
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
