import 'package:clickoncustomer/components/web/account-title-bar.dart';
import 'package:clickoncustomer/components/web/bottom-web-bar-2.dart';
import 'package:clickoncustomer/components/youorders-item.dart';
import 'package:clickoncustomer/models/order_review_model.dart';
import 'package:clickoncustomer/providers/order.dart';
import 'package:clickoncustomer/screens/web/order-details/order-details-screen.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/web/WebNavBar2.dart';
import '../../../utils/constants/color.dart';

import '../../../utils/constants/fontStyles/kanit.dart';
import '../../../utils/constants/strings.dart';
import '../../../utils/constants/themes.dart';
import '../../../utils/img-provider.dart';

class AccountOrderScreenWeb extends StatefulWidget {
  static const routeName = '/account-order-web';
  const AccountOrderScreenWeb({Key? key}) : super(key: key);

  @override
  _AccountOrderScreenWebState createState() => _AccountOrderScreenWebState();
}

class _AccountOrderScreenWebState extends State<AccountOrderScreenWeb> {
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
          body: Container(
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
                        horizontal: 200),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 61,
                        ),
                        AccountTitleBar(
                            title: 'Your Orders', isYourOrder: true),
                        SizedBox(
                          height: 141,
                        ),
                        OrderHistoryTabBar(),
                        SizedBox(
                          height: 160,
                        ),
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
          ),
        ));
  }
}

class OrderHistoryTabBar extends StatelessWidget {
  const OrderHistoryTabBar({
    Key? key, this.filterId,
  }) : super(key: key);

 final int? filterId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: ContainedTabBarView(
        tabs: const [
          Text('All Orders'),
          Text('Cancelled Orders'),
          Text('Returned Orders'),
        ],
        tabBarProperties: TabBarProperties(
            height: 32.0,
            indicatorColor: Colors.transparent,
            indicatorWeight: 6.0,
            width: 420,
            labelColor: primaryColor,
            labelStyle: medium,
            unselectedLabelColor: productAvailabilityColor,
            alignment: TabBarAlignment.start),
        views:  [
          TabBarItem(filterId: 1,),
          TabBarItem(filterId: 3,),
          TabBarItem(filterId: 0,),
        ],
        onChange: (index) => print(index),
      ),
    );
  }
}

class TabBarItem extends StatefulWidget {
  final int? filterId;
  const TabBarItem({Key? key, this.filterId}) : super(key: key);

  @override
  State<TabBarItem> createState() => _TabBarItemState();
}

class _TabBarItemState extends State<TabBarItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        '10 orders placed in',
                        style: orderPlacedStyle,
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                        height: 38,
                        width: 151,
                        child: OutlinedButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Text(
                                  'Last 3 months',
                                  style: orderPlacedStyle,
                                ),
                                const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  size: 20,
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.archive_outlined,
                        size: 18,
                      ),
                      const SizedBox(
                        width: 7,
                      ),
                      Text(
                        'Archived order',
                        style: archiveStyle,
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                  future: context.read<OrderProvider>().getOrderList(isConfirm: true, page: 1, limit: 100,filterId:widget.filterId ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.80,
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: CupertinoActivityIndicator(
                            animating: true,
                            radius: 12,
                          ),
                        ),
                      );
                    } else {
                      if (snapshot.hasData) {
                        final catList = snapshot.data as List<OrderReviewModel>?;
                        return OrderHistoryItems();
                      }
                    }
                    return Text(
                      snapshot.error.toString(),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderHistoryItems extends StatefulWidget {
  const OrderHistoryItems({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderHistoryItems> createState() => _OrderHistoryItemsState();
}

//asada
class _OrderHistoryItemsState extends State<OrderHistoryItems> {
  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
        builder: (context, value, child) => Expanded(
              child: ListView.builder(
                  //physics: NeverScrollableScrollPhysics(),
                  itemCount: value.orderList.length,
                  itemBuilder: (context, index) {
                    return YourOrder(
                        order: value.orderList[index],
                        firstIcon: 'assets/images/icon-return.png',
                        isArriving: false,
                        buttonStatus: false,
                        buttonText1: 'Return item',
                        buttonText2: 'Cancel',
                        itemImage: 'assets/images/dummy/image-baby-detail.png',
                        secondIcon: 'assets/images/icon-dispatch-yellow.png');
                  }),
            ));
  }
}
