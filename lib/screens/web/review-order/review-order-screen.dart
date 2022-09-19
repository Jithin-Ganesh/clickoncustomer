import 'package:clickoncustomer/components/checkout_component.dart';
import 'package:clickoncustomer/components/web/bottom-web-bar-2.dart';
import 'package:clickoncustomer/components/web/zig-zag-sheet.dart';
import 'package:clickoncustomer/screens/web/review-order/stepper.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/web/WebNavBar2.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/img-provider.dart';

class ReviewOrderScreenWeb extends StatefulWidget {
  static const routeName = '/review-order-screen-web';
  const ReviewOrderScreenWeb({Key? key}) : super(key: key);

  @override
  _ReviewOrderScreenWebState createState() => _ReviewOrderScreenWebState();
}

class _ReviewOrderScreenWebState extends State<ReviewOrderScreenWeb> {
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
            preferredSize: Size.fromHeight(175), child:  WebNavBar2()),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.083,right: MediaQuery.of(context).size.width * 0.083,top: 60),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children:  [
                         Checkout(title: 'Account', text: 'ID: kvsanz', isAccount: true,isProcessing: false,isSubmit: true),
                         SizedBox(height: 14,),
                         Checkout(title: 'Delivery address', text: textProdDescr, isAccount: false,isSubmit: true,isProcessing: false,),
                        SizedBox(height: 14,),
                        StepperReview(),
                        SizedBox(height: 14,),
                        PaymentTile()
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width *  0.0182,),
                    ZigZagSheet(isCoupon: true)
                  ],
                ),
                SizedBox(height: 218,),
                BottomWebBar2()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PaymentTile extends StatelessWidget {
  const PaymentTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: canvasColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      width: MediaQuery.of(context).size.width * 0.622,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 15),
        child:  PaymentTitle(title: 'Payment',isProcessing: false,isSubmit: false,slNumber: '4'),
      ),
    );
  }
}
