import 'package:clickoncustomer/providers/cart-provider.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../screens/web/review-order/review-order-screen.dart';
import '../../utils/constants/color.dart';

import '../../utils/constants/fontStyles/kanit.dart';

class ZigZagSheet extends StatefulWidget {
  final bool isCoupon;

  const ZigZagSheet({Key? key, required this.isCoupon}) : super(key: key);

  @override
  State<ZigZagSheet> createState() => _ZigZagSheetState();
}

class _ZigZagSheetState extends State<ZigZagSheet> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.193,
      child: Consumer<CartProvider>(
        builder: (context, value, child) => Container(
          width: MediaQuery.of(context).size.width * 0.193,
          alignment: Alignment.center,
          decoration: zigzagDecoration,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 27, right: 29, top: 28, bottom: 51),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.161,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, ReviewOrderScreenWeb.routeName);
                  },
                  child: Text(
                    'Proceed to Buy',
                    style: medium.copyWith(color: canvasColor, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Price Details',
                style: medium.copyWith(color: mainTitleColor, fontSize: 20),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 19,
              ),
              DottedLine(
                lineLength: MediaQuery.of(context).size.width * 0.1604,
                dashColor: dividerColor4,
              ),
              const SizedBox(
                height: 22,
              ),
              PriceItem(
                  title: 'Price (3 items)',
                  value: value.cart?.itemTotal.toString() ?? ''),
              const SizedBox(
                height: 5,
              ),
              const PriceItem(title: 'Shipping', value: 'Free'),
              const SizedBox(
                height: 5,
              ),
              PriceItem(
                  title: 'Discount', value: value.cart?.offer.toString() ?? ''),
              const SizedBox(
                height: 52,
              ),
              const Divider(
                thickness: 1,
                color: dividerColor4,
              ),
              Visibility(
                visible: widget.isCoupon,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    Row(
                      children: [
                        Text(
                          'I Have a ',
                          style: thin.copyWith(
                              color: priceDetailsSubTextColor, fontSize: 14),
                        ),
                        Text(
                          'Coupon Code ',
                          style: regular.copyWith(
                              color: couponCodeColor, fontSize: 14),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_up,
                          size: 8,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.111,
                          height: 45,
                          child: TextField(
                            decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: borderColor2, width: 1.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: borderColor2, width: 1.0),
                                ),
                                hintText: 'Enter Code',
                                hintStyle: thin.copyWith(
                                    color: hintColor, fontSize: 14)),
                          ),
                        ),
                        const SizedBox(
                          width: 7,
                        ),
                        SizedBox(
                            height: 45,
                            width: MediaQuery.of(context).size.width * 0.048,
                            child: OutlinedButton(
                                onPressed: () {},
                                child: Text(
                                  'Apply',
                                  style: medium.copyWith(color: hintColor),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                )))
                      ],
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    const Divider(
                      thickness: 1,
                      color: dividerColor4,
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Subtotal',
                    style: medium.copyWith(color: mainTitleColor, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  Text(
                    value.cart?.netTotal.toString() ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: regular.copyWith(
                        color: productAvailabilityColor, fontSize: 28),
                    textAlign: TextAlign.left,
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }
}

class PriceItem extends StatelessWidget {
  final String title;
  final String value;

  const PriceItem({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: thin.copyWith(color: priceDetailsSubTextColor, fontSize: 14),
          textAlign: TextAlign.left,
        ),
        const Spacer(),
        Text(
          value,
          style: regular.copyWith(color: mainTitleColor, fontSize: 14),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
