import 'package:clickoncustomer/screens/web/order-feedback/order-delivery-feedback.dart';
import 'package:clickoncustomer/screens/web/order-feedback/order-product-review.dart';
import 'package:clickoncustomer/screens/web/order-feedback/order-seller-feedback-screen-web.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontStyles/kanit.dart';
import '../../../utils/constants/themes.dart';

class FeedBackTitleBar extends StatefulWidget {
  final String title;
  final String? subTitle;
  const FeedBackTitleBar({Key? key, required this.title, this.subTitle})
      : super(key: key);

  @override
  State<FeedBackTitleBar> createState() => _FeedBackTitleBarState();
}

class _FeedBackTitleBarState extends State<FeedBackTitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width * 0.626,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Your Account ›',
                style: accountPathTextStyle,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                widget.subTitle ?? '',
                style: accountPathTextStyle,
              ),
            ],
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: accountTitleStyle,
              ),
              Row(
                children: [
                  Column(
                    children: [
                      TextButton(onPressed: (){
                        Navigator.pushNamed(context, OrderSellerFeedBackScreenWeb.routeName);
                      }, child:  Text(
                        'Leave Seller Feedback',
                        style: feedBackSelectedStyle,
                      ))
                     , Container(
                        height: 2,
                        color: primaryColor,
                      )
                    ],
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, OrderDeliveryFeedBackScreenWeb.routeName);
                  }, child: Text(
                    'Leave delivery feedback',
                    style: feedBackUnSelectedStyle,
                  ))
                  ,
                  SizedBox(
                    width: 25,
                  ),
                  TextButton(onPressed: (){
                    Navigator.pushNamed(context, OrderProductReviewScreenWeb.routeName);
                  }, child: Text(
                    'Write a product review',
                    style: feedBackUnSelectedStyle,
                  ))
                  ,
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
