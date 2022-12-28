
import 'package:clickoncustomer/components/web/custom-alert-box.dart';
import 'package:clickoncustomer/providers/cart-provider.dart';
import 'package:clickoncustomer/screens/web/cart/cart-screen.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/cart-products.dart';
import '../screens/login_screen.dart';
import '../utils/pref_utils.dart';


class YourCart extends StatefulWidget {
  final CartProduct? product;
  final int? cartId;
  YourCart({Key? key,  required this.product, this.cartId, }) : super(key: key);


  @override
  State<YourCart> createState() => _YourCartState();
}

class _YourCartState extends State<YourCart> {
  final List<String> items = [
    '1',
    '2',
    '3',
    '4',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        decoration: boxDecoration,
        width: MediaQuery.of(context).size.width * 0.622,
        height: 166,
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 0,top: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Row(
              children: [
                SizedBox(
                  width: 24,
                ),
                ImgProvider(
                  url: widget.product?.image ?? '',
                  width: MediaQuery.of(context).size.width * 0.0572,
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
                      style:
                          medium.copyWith(color: inStockTitleColor, fontSize: 12),
                    ),
                    SizedBox(height: 6,),
                    Text(
                      widget.product?.name ?? '',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: regular.copyWith(
                          fontSize: 14, color: productSubTextColor),
                    ),    SizedBox(height: 6,),
                    Row(children: [
                      Text(textRupees),
                      const SizedBox(
                        width: 8.85,
                      ),
                      Text(
                        widget.product?.amount.toString() ?? '',
                        style: medium.copyWith(
                            color: priceOffersSubtextColor, fontSize: 16),
                      ),
                      const SizedBox(
                        width: 18,
                      ),
                      Container(
                        height: 16,
                        width: MediaQuery.of(context).size.width * 0.0192,
                        decoration: const BoxDecoration(
                            color: discountBoxColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                bottomRight: Radius.circular(8))),
                        child: Center(
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
                        widget.product?.offer.toString() ?? '',
                        style: medium.copyWith(
                            fontSize: 12, color: priceOffersSubtextColor),
                      )
                    ]),
                    SizedBox(
                      height: 7.72,
                    ),
                    Row(
                      children: [
                        Consumer<CartProvider>(builder: (context, value, child) => Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: qtyButtonColor, width: 2),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5)),
                            ),
                            height: 28,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2(
                                  hint: Row(
                                    children: [
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(widget.product?.quantity.toString() ?? '',
                                          style: regular.copyWith(
                                              fontSize: 12,
                                              color: productSubTextColor)),
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
                        TextButton(
                         onPressed: () {
                           showMyDialog(
                             screenContext: context,
                             buttonName: "Remove",
                             title: "Alert!",
                             contentText: "Do you really want to clear the cart?",
                             onConfirm: () {
                               Provider.of<CartProvider>(context, listen: false)
                                   .deleteCart( cartId: widget.cartId)
                                   .then((value) {
                                 if(PrefUtils().getToken()!=null){
                                   Provider.of<CartProvider>(context,listen: false).fetchCart();
                                   Navigator.pushNamed(context, CartScreenWeb.routeName);
                                 }else{
                                   Navigator.pushNamed(context, LoginScreen.routeName,arguments: const LoginScreen(isLoggedIn: true));
                                 }

                               });
                             },
                           );
                         },
                         child: Text( textYourCartRemove,
                           style:
                           regular.copyWith(fontSize: 12, color: removeColor),)
                        )
                      ],
                    )
                  ],
                )
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
      ),
    );
  }
}
