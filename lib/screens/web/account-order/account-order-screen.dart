import 'package:clickoncustomer/components/web/account-title-bar.dart';
import 'package:clickoncustomer/components/web/bottom-web-bar-2.dart';
import 'package:clickoncustomer/components/youorders-item.dart';
import 'package:clickoncustomer/screens/web/order-details/order-details-screen.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:contained_tab_bar_view/contained_tab_bar_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/web/WebNavBar2.dart';
import '../../../utils/constants/color.dart';

import '../../../utils/constants/fontstyles.dart';
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
                        horizontal: MediaQuery.of(context).size.width * 0.187),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 61,
                        ),
                        AccountTitleBar(title: 'Your Orders',isYourOrder: true),
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
                    padding:  EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.083),
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
    Key? key,
  }) : super(key: key);

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
        views: const [
          TabBarItem(),
          TabBarItem(),
          TabBarItem(),
        ],
        onChange: (index) => print(index),
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  const TabBarItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                    OutlinedButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              'Last 3 months',
                              style: orderPlacedStyle,
                            ),
                            const Icon(Icons.keyboard_arrow_down_outlined),
                          ],
                        )),
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
            const SizedBox(height: 30,),
            const OrderHistoryItems(),
          ],
        ),
      ),
    );
  }
}

class OrderHistoryItems extends StatelessWidget {
  const OrderHistoryItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        YourOrder(onPressed: (){
          Navigator.pushNamed(context, OrderDetailsScreenWeb.routeName);
        },
            description: 'Preparing for Dispatch',
            title: 'Arriving Friday',
            itemName: prodDesc,
            amount: '1,054.00',
            firstIcon: 'assets/images/icon-return.png',
            isArriving: true,
            buttonStatus: true,
            buttonText1: 'Track Package',
            buttonText2: 'Cancel',
            itemImage: 'assets/images/dummy/image-projector.png',
            secondIcon: 'assets/images/icon-dispatch-green.png'),
        YourOrder(
            description: 'Return will closed on 31-Aug-2022',
            title: 'Delivered on 01-Sep-2022',
            itemName: prodDesc,
            amount: '1,054.00',
            firstIcon: 'assets/images/icon-return.png',
            isArriving: false,
            buttonStatus: false,
            buttonText1: 'Return item',
            buttonText2: 'Cancel',
            itemImage: 'assets/images/dummy/image-baby-detail.png',
            secondIcon: 'assets/images/icon-dispatch-yellow.png'),
        YourOrder(
            description: 'Preparing for Dispatch',
            title: 'Arriving Friday',
            itemName: prodDesc,
            amount: '1,054.00',
            firstIcon: 'assets/images/icon-return.png',
            isArriving: true,
            buttonStatus: true,
            buttonText1: 'Track Package',
            buttonText2: 'Cancel',
            itemImage: 'assets/images/dummy/image-projector.png',
            secondIcon: 'assets/images/icon-dispatch-green.png'),
        YourOrder(
            description: 'Preparing for Dispatch',
            title: 'Arriving Friday',
            itemName: prodDesc,
            amount: '1,054.00',
            firstIcon: 'assets/images/icon-return.png',
            isArriving: true,
            buttonStatus: true,
            buttonText1: 'Track Package',
            buttonText2: 'Cancel',
            itemImage: 'assets/images/dummy/image-projector.png',
            secondIcon: 'assets/images/icon-dispatch-green.png'),
        YourOrder(
            description: 'Preparing for Dispatch',
            title: 'Arriving Friday',
            itemName: prodDesc,
            amount: '1,054.00',
            firstIcon: 'assets/images/icon-return.png',
            isArriving: true,
            buttonStatus: true,
            buttonText1: 'Track Package',
            buttonText2: 'Cancel',
            itemImage: 'assets/images/dummy/image-projector.png',
            secondIcon: 'assets/images/icon-dispatch-green.png'),
        YourOrder(
            description: 'Preparing for Dispatch',
            title: 'Arriving Friday',
            itemName: prodDesc,
            amount: '1,054.00',
            firstIcon: 'assets/images/icon-return.png',
            isArriving: true,
            buttonStatus: true,
            buttonText1: 'Track Package',
            buttonText2: 'Cancel',
            itemImage: 'assets/images/dummy/image-projector.png',
            secondIcon: 'assets/images/icon-dispatch-green.png'),
      ],
    );
  }
}
