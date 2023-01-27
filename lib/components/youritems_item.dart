import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';

import 'package:clickoncustomer/utils/constants/strings.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/constants/fontstyles.dart';
import '../utils/constants/images.dart';

class YourItems extends StatefulWidget {
  final ProductModel? product;
  const YourItems({Key? key, required this.product}) : super(key: key);

  @override
  State<YourItems> createState() => _YourItemsState();
}

class _YourItemsState extends State<YourItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: containerDecoration,
      width: MediaQuery.of(context).size.width * 0.118,
      height: 428,
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ImgProvider(
                  url: widget.product?.thumbnail ?? '',
                  height: 149,
                  width: 149,
                ),
              ],
            ),
            SizedBox(
              height: 11.7,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.product?.name ?? '',
                    textAlign: TextAlign.start,
                    style: regular.copyWith(
                        fontSize: 14, color: productSubTextColor),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        widget.product?.sellingPrice ?? '',
                        style: regular.copyWith(
                            fontSize: 17, color: contactTitleColor),
                      ),
                      Text(
                        widget.product?.mrpPrice ?? '',
                        style: thin.copyWith(
                            fontSize: 17,
                            color: discountPriceColor,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 1.52,
                  ),
                  Text(
                    textInStock,
                    style:
                        medium.copyWith(color: inStockTitleColor, fontSize: 12),
                  ),
                  Text(
                    textYourItemsSizeAndCount,
                    style:
                        regular.copyWith(fontSize: 12, color: mainTitleColor),
                  ),
                  SizedBox(
                    height: 3,
                  ),
                  SizedBox(
                    width: 197,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side:
                              const BorderSide(width: 1.0, color: primaryColor),
                        ),
                      ),
                      child: Text(
                        moveToCart,
                        style:
                            medium.copyWith(color: primaryColor, fontSize: 16),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    yourCartItemDeleteImage,
                    width: 12,
                    height: 13,
                    color: yourItemsDeleteOutlineColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    textYourItemsDelete,
                    style:
                        regular.copyWith(color: mainTitleColor, fontSize: 12),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                      color: yourItemsLoveButtonColor,
                      Icons.favorite_border,
                      size: 15),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(textYourItemsAddToWishlist,
                      style: regular.copyWith(
                          fontSize: 12, color: mainTitleColor)),
                ),
              ],
            )
          ]),
    );
  }
}
