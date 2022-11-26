import 'package:clickoncustomer/components/payment_item.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/checkout_component.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/zig-zag-sheet.dart';
import '../../../utils/constants/color.dart';

import '../../../utils/constants/images.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/img-provider.dart';

class PaymentOrderScreenWeb extends StatefulWidget {
  static const routeName = '/payment-order-screen-web';
  const PaymentOrderScreenWeb({Key? key}) : super(key: key);

  @override
  _PaymentOrderScreenWebState createState() => _PaymentOrderScreenWebState();
}

class _PaymentOrderScreenWebState extends State<PaymentOrderScreenWeb> {
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
            padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.083,vertical: 60),
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
                        Checkout(title: 'Review Order', text: textProdDescr, isAccount: false,isSubmit: true,isProcessing: false,),
                        SizedBox(height: 14,),
                        PaymentItem(imageIcon: 'assets/images/icon-book-mark.png', title: 'Demo', isCvv: true, isPay: true)
                      ],
                    ),
                    SizedBox(width: MediaQuery.of(context).size.width *  0.0182,),
                    ZigZagSheet(isCoupon: true)
                  ],
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
