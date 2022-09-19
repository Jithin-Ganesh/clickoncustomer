import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import '../../screens/web/review-order/review-order-screen.dart';
import '../../utils/constants/color.dart';
import '../../utils/constants/fontstyles.dart';
import '../elevated-buton.dart';

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
      child: Container(
        width: 371,
        alignment: Alignment.center,
        decoration: zigzagDecoration,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(vertical: 55.0, horizontal: 30),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
                  width: 310,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ReviewOrderScreenWeb.routeName);
                    },
                    child: Text(
                      'Proceed to Buy',
                      style:
                          medium.copyWith(color: canvasColor, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Price Details',
                  style:
                      medium.copyWith(color: mainTitleColor, fontSize: 20),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 19,
                ),
                Divider(
                  thickness: 1,
                  color: dividerColor4,
                ),
                SizedBox(
                  height: 22,
                ),
                PriceItem(title: 'Price (3 items)', value: '9,053.00'),
                SizedBox(
                  height: 5,
                ),
                PriceItem(title: 'Shipping', value: 'Free'),
                SizedBox(
                  height: 5,
                ),
                PriceItem(title: 'Discount', value: '-1000.00'),
                SizedBox(
                  height: 52,
                ),
                Divider(
                  thickness: 1,
                  color: dividerColor4,
                ),
                 Visibility(
                   visible: widget.isCoupon,
                   child: Column(
                    children: [
                      SizedBox(height: 18,),
                      Row(children: [
                        Text('I Have a ',  style: thin.copyWith(color: priceDetailsSubTextColor, fontSize: 14),),
                        Text('Coupon Code ',  style: regular.copyWith(color: couponCodeColor, fontSize: 14),),
                        Icon(Icons.keyboard_arrow_up,size: 8,)
                      ],),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.111,
                            height: 45,
                            child: TextField(
                              decoration: new InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color:  borderColor2, width: 1.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: borderColor2, width: 1.0),
                                ),
                                hintText: 'Enter Code',
                                hintStyle: thin.copyWith(color: hintColor,fontSize: 14)
                              ),
                            ),
                          ),
                          SizedBox(width: 7,),
                          SizedBox(
                              height: 45,
                              width: MediaQuery.of(context).size.width * 0.0463,
                              child: OutlinedButton(onPressed: (){}, child: Text('Apply',style: medium.copyWith(color: hintColor),overflow: TextOverflow.ellipsis,maxLines: 1,)))
                        ],
                      ),
                      SizedBox(height: 60,),
                      Divider(
                        thickness: 1,
                        color: dividerColor4,
                      ),
                    ],
                ),
                 ) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subtotal',
                      style: medium.copyWith(
                          color: mainTitleColor, fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                    Expanded(
                      child: Text(
                        '8,053.00',maxLines: 1,overflow: TextOverflow.ellipsis,
                        style: regular.copyWith(
                            color: productAvailabilityColor, fontSize: 28),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )
              ]),
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
        Text(
          value,
          style: regular.copyWith(color: mainTitleColor, fontSize: 14),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}
