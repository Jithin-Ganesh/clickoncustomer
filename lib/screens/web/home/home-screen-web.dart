import 'package:clickoncustomer/components/topPickItem.dart';
import 'package:clickoncustomer/screens/web/home/top_picks.dart';
import 'package:clickoncustomer/providers/category-provider.dart';
import 'package:clickoncustomer/screens/web/home/products-for-you.dart';
import 'package:clickoncustomer/screens/web/home/recently-viewed.dart';
import 'package:clickoncustomer/screens/web/home/tab-bar.dart';
import 'package:clickoncustomer/screens/web/home/web-carousel-slider.dart';
import 'package:clickoncustomer/utils/constants/color.dart';
import 'package:clickoncustomer/utils/constants/decoration.dart';
import 'package:clickoncustomer/utils/constants/fontstyles.dart';
import 'package:clickoncustomer/utils/constants/responsive.dart';
import 'package:clickoncustomer/utils/img-provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/web/WebNavBar2.dart';
import '../../../components/web/bottom-web-bar.dart';
import '../../../components/web/custom-titlebar-with-viewall.dart';
import '../../../components/web/web-nav-bar.dart';
import 'best-selling.dart';
import 'category-list.dart';
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
    Future.delayed(const Duration(seconds: 2), () {
      Provider.of<CategoryProvider>(context, listen: false).fetchCategory();
    });

    // TODO: implement initState
    super.initState();
  }

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
        backgroundColor: bgColor.withOpacity(0.3),
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(175), child:  WebNavBar2()),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 150.0, vertical: 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HomeBannerCarousel(),
                    const SizedBox(
                      height: 44,
                    ),
                    // Consumer<CategoryProvider>(
                    //     builder: (context, value, child) => HomeCategoryList(
                    //           categories: value.categoriesList,
                    //         )),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 367,
                          width: MediaQuery.of(context).size.width * 0.55,
                          decoration: containerDecoration,
                          child: const TopPicks(),
                        ),
                        Column(
                          children: [
                            Container(
                              height: 230,
                              width: 461,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                      image: AssetImage(
                                          "assets/images/dummy/image-exclusive.png")
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const ImgProvider(
                                    url: "assets/images/dummy/image-qr.png",
                                    height: 74,
                                    width: 74,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Enjoy Fast, Simple hassle free Shopping',
                                        style: regular.copyWith(
                                            color: exclusiveOfferSubtextColor,
                                            fontSize: 16),
                                      ),
                                      Text(
                                        'Enjoy Fast, Simple hassle free Shopping',
                                        style: thin.copyWith(
                                            color: exclusiveOfferSubtextColor,
                                            fontSize: 14),
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
                    const SizedBox(
                      height: 55,
                    ),
                    const GroupOrders(),
                    const SizedBox(
                      height: 55,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Best Selling Products',style: medium.copyWith(color: Colors.black,fontSize: 28),),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    const CustomTabBarView(),
                    const SizedBox(
                      height: 55,
                    ),
                    const CustomTitleBarViewAll(title: 'Products For You'),
                    const SizedBox(
                      height: 31,
                    ),
                    const ProductsForYouList(),
                    const SizedBox(
                      height: 25,
                    ),
                    const Divider(
                      color: horizontalDividerColor,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const CustomTitleBarViewAll(title: 'Just Launched'),
                    const SizedBox(
                      height: 12,
                    ),
                    const JustLaunchedList(),
                    const SizedBox(
                      height: 55,
                    ),
                    const CustomTitleBarViewAll(title: 'Best Selling'),
                    const SizedBox(
                      height: 12,
                    ),
                    BestSelling(),
                    const SizedBox(
                      height: 25,
                    ),
                    const Divider(
                      color: horizontalDividerColor,
                      height: 1,
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const CustomTitleBarViewAll(title: 'Fashion Store'),
                    const SizedBox(
                      height: 12,
                    ),
                    FashionStore(),
                    const SizedBox(
                      height: 55,
                    ),
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
                    RecentlyViewedProducts(),
                  ],
                ),
              ),
              const BottomWebBar()
            ],
          ),
        ),
      ),
    );
  }
}
