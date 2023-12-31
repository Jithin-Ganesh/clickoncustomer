import 'package:clickoncustomer/components/web/discount-box.dart';
import 'package:clickoncustomer/components/web/rating-box.dart';
import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/utils/constants/color.dart';

import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/toast-message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:provider/provider.dart';

import '../providers/cart-provider.dart';

import '../screens/login_screen.dart';
import '../utils/constants/fontStyles/kanit.dart';
import '../utils/global-key.dart';
import '../utils/pref_utils.dart';

class ProductDetailTitle extends StatelessWidget {
  ProductDetailTitle({
    Key? key,
    required this.productId,
    this.name, this.product,
  }) : super(key: key);
  final int? productId;
  final ProductModel? product;
  final String? name;
  final List<String> items = ['Qty 1', 'Qty 2', 'Qty 3', 'Qty 4'];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primaryColor,
      width: MediaQuery.of(context).size.width * 1,
      height: 98,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.083,
        ),
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
                    size: 23,
                    color: canvasColor,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 28,
            ),
            Text(
              name ?? '',
              style: medium.copyWith(fontSize: 24, color: Colors.white),
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
                       DiscountBox(discount: product?.offer.toString() ?? ''),
                      const SizedBox(
                        width: 13,
                      ),
                      Text(
                        product?.sellingPrice ?? '',
                        style:
                            regular.copyWith(fontSize: 28, color: Colors.white),
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
                        width: 8,
                      ),
                      Text(
                        product?.price.toString() ?? '',
                        style: regular.copyWith(
                            fontSize: 16,
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
              Consumer<CartProvider>(
                builder: (context, cart, child) => Container(
                  height: 40,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      side:
                          const BorderSide(width: 1.0, color: defaultTextColor),
                    ),
                    onPressed: () {},
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2(
                          icon: const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          ),
                          hint: Row(
                            children: [
                              Text(quantityText,
                                  style: medium.copyWith(
                                      fontSize: 14, color: defaultTextColor)),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                cart.quantity.toString(),
                                style: medium.copyWith(
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
                                        fontSize: 10,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          value: selectedValue,
                          onChanged: (value) {
                            selectedValue = value as String;
                            Provider.of<CartProvider>(context, listen: false)
                                .setQuantity(
                                    qty: int.parse(selectedValue?[selectedValue!.length - 1 ] ?? '0'));
                          }),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 13,
              ),
              SizedBox(
                width: 145,
                height: 40,
                child: MaterialButton(
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
              ),
              const SizedBox(
                width: 14,
              ),
              Container(
                width: 139,
                height: 40,
                child: OutlinedButton(
                  onPressed: () {
                    if (PrefUtils().getToken() != null) {
                      Provider.of<CartProvider>(context, listen: false)
                          .addCart(
                            productId: productId,
                          );
                    } else {
                      Navigator.pushNamed(context, LoginScreen.routeName,
                          arguments: const LoginScreen(isLoggedIn: true));
                    }
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
