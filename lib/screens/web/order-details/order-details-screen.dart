import 'package:clickoncustomer/models/order_review_model.dart';
import 'package:clickoncustomer/models/product-model.dart';
import 'package:clickoncustomer/screens/web/order-details/order-details-item-web.dart';
import 'package:clickoncustomer/screens/web/order-details/order-timeline.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/account-title-bar.dart';
import '../../../components/web/bottom-web-bar-2.dart';
import '../../../components/web/order-details-title-bar.dart';
import '../../../providers/order.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/img-provider.dart';

class OrderDetailsScreenWeb extends StatefulWidget {
  static const routeName = '/order-details-web';
  const OrderDetailsScreenWeb({
    Key? key,
    this.id,
  }) : super(key: key);
  final int? id;

  @override
  _OrderDetailsScreenWebState createState() => _OrderDetailsScreenWebState();
}

class _OrderDetailsScreenWebState extends State<OrderDetailsScreenWeb> {
  OrderDetailsScreenWeb _args() {
    final args =
        ModalRoute.of(context)!.settings.arguments as OrderDetailsScreenWeb;
    return args;
  }

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
          body: FutureBuilder(
              future: Provider.of<OrderProvider>(context, listen: false)
                  .getOrderId(orderId: _args().id),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (snapshot.hasData) {
                    final order = snapshot.data as OrderReviewModel;
                    return OrderDetailBody(
                      order: order,
                      productId: order.productId,
                    );
                  }
                }
                return Text(
                  snapshot.error.toString(),
                );
              }),
        ));
  }
}

class OrderDetailBody extends StatelessWidget {
  const OrderDetailBody({
    Key? key,
    required this.order,
    this.productId,
  }) : super(key: key);
  final OrderReviewModel order;
  final int? productId;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.187),
              child: Column(
                children: [
                  const SizedBox(
                    height: 61,
                  ),
                  const AccountTitleBar(
                    title: 'Order Details',
                    subTitle: 'Your Orders',
                  ),
                  const SizedBox(
                    height: 57,
                  ),
                  const OrderDetailsTitleBar(),
                  const SizedBox(
                    height: 5,
                  ),
                  OrderDetailsItemWeb(
                    productId: productId,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  //OrderTimeLine(),
                  const SizedBox(
                    height: 311,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.083),
              child: const BottomWebBar2(),
            )
          ],
        ),
      ),
    );
  }
}
