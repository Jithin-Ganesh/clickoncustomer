import 'package:clickoncustomer/components/checkout_component.dart';
import 'package:clickoncustomer/components/revieworderitem.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/color.dart';

import '../../../utils/constants/fontstyles.dart';
import '../order-payment/order-payment-web.dart';

class StepperReview extends StatefulWidget {
  const StepperReview({Key? key}) : super(key: key);

  @override
  State<StepperReview> createState() => _StepperReviewState();
}

class _StepperReviewState extends State<StepperReview> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1196,
      width: MediaQuery.of(context).size.width * 0.622,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: canvasColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            offset: const Offset(0.0, 1.0), //(x,y)
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, top: 21, right: 23, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const PaymentTitle(
                title: 'Review Order',
                isProcessing: true,
                isSubmit: false,
                slNumber: '3'),
            const SizedBox(
              height: 39,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 70,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: checkedItemsColor,
                            ),
                            child: Center(
                                child: Icon(
                              Icons.check,
                              color: canvasColor,
                              size: 11,
                            )),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Cash on Delivery (1)',
                            style: medium.copyWith(
                                fontSize: 16, color: reviewTextColor2),
                          )
                        ],
                      ),
                      DottedLine(
                        lineLength: 215,
                        dashColor: dividerColor4,
                      ),
                      Column(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: circledNumberButtonColor,
                            ),
                            child: Center(
                                child: Icon(
                              Icons.check,
                              color: canvasColor,
                              size: 11,
                            )),
                          ),
                          SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Pay Online  (3)',
                            style: medium.copyWith(
                                fontSize: 16, color: primaryColor),
                          )
                        ],
                      ),
                      //DottedLine(dashLength: 30, dashGapLength: 30),
                    ],
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0),
              child: Divider(
                thickness: 1,
                color: dividerColor3,
              ),
            ),
            SizedBox(
              height: 715,
              child: ListView.separated(
                  itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 40.0, horizontal: 70),
                        child: ReviewOrderItem(
                            title: 'Tomorrow',
                            isOrder: true,
                            isGift: true,
                            itemName:
                                'Elago Compatible with iPhone 13 Pro Max Case, Liquid Silicone Case,',
                            offerPrice: '764.00',
                            price: '1200.00'),
                      ),
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 70.0),
                        child: Divider(
                          thickness: 1,
                          color: dividerColor3,
                        ),
                      ),
                  itemCount: 3),
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 70.0),
              child: Divider(
                thickness: 1,
                color: dividerColor3,
              ),
            ),
            const SizedBox(
              height: 38,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: SizedBox(
                height: 40,
                width: 310,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(
                        context, PaymentOrderScreenWeb.routeName);
                  },
                  child: Text(
                    'Proceed to Buy',
                    style: medium.copyWith(color: canvasColor, fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
