import 'package:clickoncustomer/components/elevated-buton.dart';
import 'package:clickoncustomer/components/web/custom-title-bar.dart';
import 'package:clickoncustomer/components/web/zig-zag-sheet.dart';
import 'package:clickoncustomer/components/yourcart.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/screens/web/cart/cart-tab-bar.dart';
import 'package:clickoncustomer/screens/web/home/tab-bar.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:provider/provider.dart';

import '../../../components/clipper.dart';
import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/bottom-web-bar.dart';
import '../../../components/web/custom-titlebar-with-viewall.dart';
import '../../../utils/constants/color.dart';
import '../../../utils/constants/fontstyles.dart';
import '../../../utils/img-provider.dart';
import '../home/products-for-you.dart';
import '../home/recently-viewed.dart';

class CartScreenWeb extends StatefulWidget {
  static const routeName = '/cart-screen-web';
  const CartScreenWeb({Key? key}) : super(key: key);

  @override
  _CartScreenWebState createState() => _CartScreenWebState();
}

class _CartScreenWebState extends State<CartScreenWeb> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
      tablet: Container(
        child: const Center(
          child: ImgProvider(
            url: "assets/images/clickOn-logo.png",
            height: 100,
            width: 200,
          ),
        ),
      ),
      mobile: Container(
        child: const Center(
          child: const ImgProvider(
            url: "assets/images/clickOn-logo.png",
            height: 100,
            width: 200,
          ),
        ),
      ),
      desktop: Scaffold(
        backgroundColor: bgColor2,
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(175), child:  WebNavBar2()),
        body: Consumer<CategoryProvider>(builder: (context, value, child) => SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 160.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 91,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Expanded(
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(right: 38.0),
                                 child: CustomTitleBar(title: 'Your Cart',isShop: true),
                               ),
                               SizedBox(height: 22,),
                               YourCart(),
                               SizedBox(height: 13,),
                               YourCart(),
                               SizedBox(height: 13,),
                               YourCart()
                             ],
                           ),
                         ),
                         ZigZagSheet(isCoupon: false,),
                       ],
                     ),
                      SizedBox(height: 118,),
                      CustomTitleBar(title: 'Your Items',),
                      SizedBox(height: 32,),
                      CartTabBar(),
                      SizedBox(height: 91,),
                      CustomTitleBarViewAll(title: 'Explore more items'),
                      const SizedBox(
                        height: 31,
                      ),
                      const ProductsForYouList(),
                      SizedBox(height: 60,),
                      const Divider(
                        color: horizontalDividerColor,
                        height: 1,
                      ),
                      SizedBox(height: 75,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recently Viewed Products',
                            style: medium.copyWith(
                                color: Colors.black, fontSize: 28),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            'View/Edit Browsing History',
                            style:
                            medium.copyWith(color: groupOrdersTitleTextColor),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      RecentlyViewedProducts(recently: value.recentlyAdded ?? []),
                      SizedBox(height: 106,)

                    ],
                  ),
                ),
                const BottomWebBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
