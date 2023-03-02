import 'package:clickoncustomer/components/checkout_component.dart';
import 'package:clickoncustomer/components/revieworderitem.dart';
import 'package:clickoncustomer/providers/auth.dart';
import 'package:clickoncustomer/providers/product-provider.dart';
import 'package:clickoncustomer/providers/user-provider.dart';
import 'package:clickoncustomer/utils/constants/screen-utils.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart-provider.dart';
import '../../../providers/home_provider.dart';
import '../../../providers/order.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontStyles/kanit.dart';
import '../home/home-screen-web.dart';
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
      // height: 750,
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
        child: Consumer<CartProvider>(
          builder: (context, value, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaymentTitle(
                  title: 'Review Order',
                  isProcessing: true,
                  isSubmit: false,
                  slNumber: '3'),
              const SizedBox(
                height: 111,
              ),
              SizedBox(
                height: 700,
                child: ContainedTabBarView(
                    onChange: (index) => Provider.of<UserProvider>(context,listen: false).setOnline(index: index),
                    tabs: [
                      Column(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: checkedItemsColor,
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.check,
                              color: canvasColor,
                              size: 11,
                            )),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Cash on Delivery (${value.cart?.cartProducts?.length.toString()})',
                            style: medium.copyWith(
                                fontSize: 16, color: reviewTextColor2),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 25,
                            width: 25,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: circledNumberButtonColor,
                            ),
                            child: const Center(
                                child: Icon(
                              Icons.check,
                              color: canvasColor,
                              size: 11,
                            )),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          Text(
                            'Pay Online  (${value.cart?.cartProducts?.length.toString()})',
                            style: medium.copyWith(
                                fontSize: 16, color: reviewTextColor2),
                          )
                        ],
                      ),
                    ],
                    tabBarProperties: TabBarProperties(
                        indicatorColor: Colors.transparent,
                        indicatorWeight: 6.0,
                        width: calcWidth(context, 400),
                        labelColor: primaryColor,
                        labelStyle: medium,
                        unselectedLabelColor: reviewTextColor2,
                        alignment: TabBarAlignment.center),
                    views: const [
                      PayCodBox(),
                      PayOnlineBox(),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PayOnlineBox extends StatelessWidget {
  const PayOnlineBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: Divider(
              thickness: 1,
              color: dividerColor3,
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40.0, horizontal: 70),
                      child: ReviewOrderItem(
                        title: 'Tomorrow',
                        product: value.cart?.cartProducts?[index],
                        isOrder: true,
                        isGift: true,
                      ),
                    ),
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.0),
                      child: Divider(
                        thickness: 1,
                        color: dividerColor3,
                      ),
                    ),
                itemCount: value.cart?.cartProducts?.length ?? 1),
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
                onPressed: () {
                  Navigator.pushNamed(context, PaymentOrderScreenWeb.routeName);
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
    );
  }
}

class PayCodBox extends StatelessWidget {
  const PayCodBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    placeOrder(
        {
          required int? shipping,
          required int? billing,
          required int? cartId}) {
      Provider.of<OrderProvider>(context, listen: false)
          .placeOrder(
          shipping: shipping,
          billing: billing,
          cartId: cartId, mode: 1)
          .then((value) {
        if (value) {
          Navigator.pushNamedAndRemoveUntil(context, HomeScreenWeb.routeName, (route) => false);

        }
      });
    }

    return Consumer<CartProvider>(
      builder: (context, value, child) => Column(
        //mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 70.0),
            child: Divider(
              thickness: 1,
              color: dividerColor3,
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.separated(
                itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 40.0, horizontal: 70),
                      child: ReviewOrderItem(
                        title: 'Tomorrow',
                        product: value.cart?.cartProducts?[index],
                        isOrder: true,
                        isGift: true,
                      ),
                    ),
                separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 70.0),
                      child: Divider(
                        thickness: 1,
                        color: dividerColor3,
                      ),
                    ),
                itemCount: value.cart?.cartProducts?.length ?? 1),
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
          Consumer<UserProvider>(builder: (context, user, child) => Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: SizedBox(
                height: 40,
                width: 310,
                child: ElevatedButton(
                  onPressed: () async {
                    await Provider.of<OrderProvider>(context,listen: false).addCartProducts(products: value.cart?.cartProducts);
                    placeOrder(
                        cartId: value.cart?.id,
                        billing: user.selectedAddress?.id,
                        shipping: user.selectedAddress?.id);
                   // Navigator.pushNamed(context, PaymentOrderScreenWeb.routeName);
                  },
                  child: Text(
                    'CheckOut',
                    style: medium.copyWith(color: canvasColor, fontSize: 16),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );


  }



}
