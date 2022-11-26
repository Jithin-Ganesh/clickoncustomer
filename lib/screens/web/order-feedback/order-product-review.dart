import 'package:clickoncustomer/components/rate-your-experience-screen1.dart';
import 'package:clickoncustomer/screens/web/order-feedback/feedback-title-bar.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/rate-your-experience-screen2.dart';
import '../../../components/rate-your-experience-screen3.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/account-title-bar.dart';
import '../../../components/web/bottom-web-bar-2.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/img-provider.dart';

class OrderProductReviewScreenWeb extends StatefulWidget {
  static const routeName = '/order-product-review-web';
  const OrderProductReviewScreenWeb({Key? key}) : super(key: key);

  @override
  _OrderProductReviewScreenWebState createState() => _OrderProductReviewScreenWebState();
}

class _OrderProductReviewScreenWebState extends State<OrderProductReviewScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: const Center(
        child: ImgProvider(
          url: "assets/images/clickOn-logo.png",
          height: 100,
          width: 200,
        ),
      ),
      mobile: const Center(
        child: ImgProvider(
          url: "assets/images/clickOn-logo.png",
          height: 100,
          width: 200,
        ),
      ),
      desktop: Scaffold(
        backgroundColor: bgColor2,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(175), child: WebNavBar2()),
        body:  Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    primaryColor.withOpacity(.16),
                    gradiant2,
                  ])),
          child: SingleChildScrollView(
            child:  Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.187),
                  child: Column(
                    children: const [
                      SizedBox(
                        height: 61,
                      ),
                      FeedBackTitleBar(title: 'Review this Product',subTitle: 'Your Orders',),
                      SizedBox(height: 57,),
                      RateYourExperience3(),
                      SizedBox(height: 86,)
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.083),
                  child: const BottomWebBar2(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
