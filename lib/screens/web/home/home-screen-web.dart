import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/screens/web/home/products-for-you.dart';
import 'package:clickoncustomer/screens/web/home/recently-viewed.dart';
import 'package:clickoncustomer/screens/web/home/tab-bar.dart';
import 'package:clickoncustomer/screens/web/home/web-carousel-slider.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/web/bottom-web-bar.dart';
import '../../../components/web/custom-titlebar-with-viewall.dart';
import '../../../components/web/web-nav-bar.dart';
import 'best-selling.dart';
import 'fashion-store.dart';
import 'group-orders.dart';
import 'just-launched.dart';

class HomeScreenWeb extends StatefulWidget {
  const HomeScreenWeb({Key? key}) : super(key: key);

  @override
  _HomeScreenWebState createState() => _HomeScreenWebState();
}

class _HomeScreenWebState extends State<HomeScreenWeb> {
  @override
  void initState() {
    Provider.of<CategoryProvider>(context, listen: false).fetchCategory();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(135), child: WebNavBar()),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 150.0, vertical: 60),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeBannerCarousel(),
                  SizedBox(
                    height: 55,
                  ),
                  //Consumer<CategoryProvider>(builder: (context, value, child) => HomeCategoryList(categories: value.categoriesList,)),
                  SizedBox(
                    height: 55,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 360,
                        width: MediaQuery.of(context).size.width * 0.45,
                        decoration: BoxDecoration(
                            color: canvasColor,
                            borderRadius: BorderRadius.circular(10)),
                      ),

                      Column(
                        children: [
                          Container(
                            height: 230,
                            width: 461,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/dummy/image-exclusive.png")
                             // image:  ImgProvider( url: "assets/images/dummy/image-exclusive.png",height: 230,width: 461,),
                            )),
                          ),
                          Container(
                            height: 149,
                            width: 458,
                            decoration: BoxDecoration(
                                color: canvasColor,
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ImgProvider( url: "assets/images/dummy/image-qr.png",height: 74,width: 74,),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Enjoy Fast, Simple hassle free Shopping',
                                      style: regular.copyWith(color: exclusiveOfferSubtextColor, fontSize: 16),
                                    ),
                                    Text(
                                      'Enjoy Fast, Simple hassle free Shopping',
                                      style: thin.copyWith(color: exclusiveOfferSubtextColor, fontSize: 14),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 55,
                  ),
                  GroupOrders(),
                  SizedBox(
                    height: 55,
                  ),
                  CustomTitleBarViewAll(title:   'Best Selling Products'),
                  SizedBox(
                    height: 12,
                  ),
                  CustomTabBarView(),
                  SizedBox(
                    height: 55,
                  ),
                  CustomTitleBarViewAll(title:   'Products For You'),
                  SizedBox(
                    height: 12,
                  ),
                  ProductsForYouList(),
                  SizedBox(
                    height: 25,
                  ),
                  Divider(
                    color: horizontalDividerColor,
                    height: 1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTitleBarViewAll(title: 'Just Launched'),
                  SizedBox(
                    height: 12,
                  ),
                  JustLaunchedList(),
                  SizedBox(
                    height: 55,
                  ),
                  CustomTitleBarViewAll(title: 'Best Selling'),
                  SizedBox(
                    height: 12,
                  ),
                  BestSelling(),
                  SizedBox(
                    height: 25,
                  ),
                  Divider(
                    color: horizontalDividerColor,
                    height: 1,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  CustomTitleBarViewAll(title: 'Fashion Store'),
                  SizedBox(
                    height: 12,
                  ),
                  FashionStore(),
                  SizedBox(
                    height: 55,
                  ),
                  CustomTitleBarViewAll(title: 'Recently Viewed Products'),
                  SizedBox(
                    height: 12,
                  ),
                  RecentlyViewedProducts(),
                ],
              ),
            ),
            BottomWebBar()
          ],
        ),
      ),
    );
  }
}
